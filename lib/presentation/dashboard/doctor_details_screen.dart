import 'dart:convert';
import 'dart:io';
import 'package:doctor_bima/appStateContainer/app_state_container.dart';
import 'package:doctor_bima/appStateContainer/app_state_model.dart';
import 'package:doctor_bima/components/custom_text_field.dart';
import 'package:doctor_bima/di/di_initializer.dart';
import 'package:doctor_bima/generated/l10n.dart';
import 'package:doctor_bima/models/doctors_list_model.dart';
import 'package:doctor_bima/storage/shared_preferences.dart';
import 'package:doctor_bima/style/app_colors.dart';
import 'package:doctor_bima/style/font.dart';
import 'package:doctor_bima/style/spacing.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final DoctorDetailsModel doctorDetailsModel;
  const DoctorDetailsScreen({Key key, this.doctorDetailsModel})
      : super(key: key);

  @override
  _DoctorDetailsScreenState createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 4.0;
  bool areFieldsEditable = false;
  TextEditingController firstNameTextController;
  TextEditingController lastNameTextController;
  TextEditingController contactNoTextController;
  StateContainerState appStateContainer;
  AppStateModel appStateModel;

  @override
  void initState() {
    super.initState();

    firstNameTextController = TextEditingController();
    lastNameTextController = TextEditingController();
    contactNoTextController = TextEditingController();

    firstNameTextController.text = widget?.doctorDetailsModel?.first_name;
    lastNameTextController.text = widget?.doctorDetailsModel?.last_name;
    contactNoTextController.text =
        widget?.doctorDetailsModel?.primary_contact_no;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appStateContainer = StateContainer.of(context);
    appStateModel = ScopedModel.of<AppStateModel>(context);
  }

  void updateDoctorDetailsList() async {
    String localStorageString = await DI
        .inject<Preferences>()
        .getStringForKey(preferencesKeys.kDoctorsListData);
    List<DoctorDetailsModel> doctorDetailsList = jsonDecode(localStorageString)
        .map<DoctorDetailsModel>((dynamic doctorDetailsModel) =>
            DoctorDetailsModel.fromJson(doctorDetailsModel))
        .toList();

    doctorDetailsList.forEach((element) {
      if (element.id == widget.doctorDetailsModel.id) {
        element.first_name = firstNameTextController.text;
        element.last_name = lastNameTextController.text;
        element.primary_contact_no = contactNoTextController.text;
      }
    });
    await DI.inject<Preferences>().setStringForKey(
        preferencesKeys.kDoctorsListData, jsonEncode(doctorDetailsList));

    appStateContainer.appUpdateValue(true);
    appStateModel.appUpdateValue(true);
  }

  Widget profileImageWidget() {
    return Container(
      width: circleRadius,
      height: circleRadius,
      decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(circleBorderWidth),
        child: DecoratedBox(
          decoration: ShapeDecoration(
              shape: CircleBorder(),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${widget.doctorDetailsModel?.profile_pic}",
                  ))),
        ),
      ),
    );
  }

  Widget personalDetails(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: circleRadius / 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSpacing.sizeBoxHt50,
              Text("${widget.doctorDetailsModel?.first_name ?? ""}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSize.subtitle,
                      color: AppColors.primary)),
              AppSpacing.sizeBoxHt10,
              GestureDetector(
                key: const Key("doctor_details_screen_button_edit_save"),
                onTap: () {
                  setState(() {
                    areFieldsEditable = !areFieldsEditable;
                  });

                  if (!areFieldsEditable) {
                    updateDoctorDetailsList();
                  }
                },
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.persianGreen,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: areFieldsEditable
                      ? Center(
                          child: Text(Strings.of(context).saveProfile,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFontSize.small,
                                  color: AppColors.white)),
                        )
                      : Center(
                          child: Text(Strings.of(context).editProfile,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppFontSize.small,
                                  color: AppColors.white)),
                        ),
                ),
              ),
              AppSpacing.sizeBoxHt10,
              Container(
                height: size.height * 0.629308,
                width: double.infinity,
                color: AppColors.greyGradient,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppSpacing.sizeBoxHt10,
                    Text(Strings.of(context).personalDetails,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontSize.subtitle,
                            color: AppColors.black)),
                    AppSpacing.sizeBoxHt10,
                    CustomTextField(
                        key: const Key(
                            "doctor_details_screen_textfield_firstname"),
                        onChanged: (value) {
                          firstNameTextController.text = value;
                        },
                        textHint: Strings.of(context).firstName,
                        isEditable: areFieldsEditable,
                        textEditingController: firstNameTextController),
                    CustomTextField(
                        key: const Key(
                            "doctor_details_screen_textfield_lastname"),
                        onChanged: (value) {
                          lastNameTextController.text = value;
                        },
                        textHint: Strings.of(context).lastName,
                        isEditable: areFieldsEditable,
                        textEditingController: lastNameTextController),
                    CustomTextField(
                        key: const Key(
                            "doctor_details_screen_textfield_contact_no"),
                        onChanged: (value) {
                          contactNoTextController.text = value;
                        },
                        textHint: Strings.of(context).contactNumber,
                        isEditable: areFieldsEditable,
                        textEditingController: contactNoTextController),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final StateContainerState appStateContainer = StateContainer.of(context);
    return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
              key: const Key("doctor_details_screen_button_arrow_back"),
              icon: Icon(Icons.arrow_back),
              color: AppColors.accent,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: AppColors.primary,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[personalDetails(size), profileImageWidget()],
              ),
            ],
          ),
        ));
  }
}
