import 'package:doctor_bima/bloc/login/login_bloc.dart';
import 'package:doctor_bima/bloc/login/login_event.dart';
import 'package:doctor_bima/bloc/login/login_state.dart';
import 'package:doctor_bima/components/custom_button.dart';
import 'package:doctor_bima/navigation/routes.dart';
import 'package:doctor_bima/presentation/firebaseAuth/otp_validation_screen.dart';
import 'package:doctor_bima/style/app_colors.dart';
import 'package:doctor_bima/style/font.dart';
import 'package:doctor_bima/style/spacing.dart';
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController _controller = TextEditingController();
  String phoneValidationMsg;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<LoginBloc>(context)
        .add(CheckIfUserAuthenticatedEvent(context: context));
  }

  String checkPhoneValidation(String value) {
    //TODO commenting beacuse this "9999999999" will always throw invalid number

    // Pattern pattern = r"^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$";
    Pattern pattern = r"";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty)
      return 'Phone cannot be empty.';
    else if (!regex.hasMatch(value))
      return 'Enter a valid phone number';
    else
      return null;
  }

  Widget enterMobileNumberWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ENTER YOUR MOBILE NUMBER",
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.title,
                color: AppColors.white)),
        AppSpacing.sizeBoxHt10,
        Container(
            margin: EdgeInsets.only(top: 40, right: 10, left: 10),
            child: TextFormField(
              autocorrect: true,
              keyboardType: TextInputType.phone,
              cursorColor: AppColors.accent,
              style: TextStyle(color: AppColors.accent),
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              onChanged: (value) {
                setState(() {
                  _controller.text = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                    fontSize: AppFontSize.normal, color: AppColors.accent),
                prefix: CountryListPick(
                  initialSelection: '+91',
                  theme: CountryTheme(
                    isShowFlag: false,
                    isShowTitle: false,
                    isShowCode: true,
                    isDownIcon: true,
                    showEnglishName: false,
                    labelColor: AppColors.persianGreen,
                  ),
                  onChanged: (CountryCode code) {},
                ),
                suffix: IconButton(
                    iconSize: 20,
                    icon: Icon(Icons.cancel_outlined),
                    color: AppColors.accent,
                    onPressed: () {
                      _controller.clear();
                    }),
              ),
            )),
        phoneValidationMsg != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppSpacing.sizeBoxHt10,
                  Text("Please enter valid phone number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: AppFontSize.small,
                          color: AppColors.errorColor)),
                ],
              )
            : Container(),
        AppSpacing.sizeBoxHt10,
        Text(
            "We will send you an SMS with teh verification code to this number",
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: AppFontSize.normal,
                color: AppColors.white)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: AppColors.primary,
      body: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) => true,
        listener: (BuildContext context, LoginState state) {
          if (state is AuthCheckFailureState) {
            _scaffoldkey.currentState.showSnackBar(SnackBar(
                content: Text("Something went wrong please try again later.")));
          }

          if (state is UserAuthenticatedState) {
            Navigator.popAndPushNamed(context, Routes.homeScreen);
          }
        },
        buildWhen: (previous, current) => true,
        builder: (BuildContext context, LoginState state) {
          if (state is AuthCheckInitialState ||
              state is AuthCheckLoadingState) {
            return Center(
                child: Container(
              child: Text("Hang On...Loading..!!",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: AppFontSize.subtitle,
                      color: AppColors.white)),
            ));
          } else if (state is UserUnAuthenticatedState) {
            return Container(
              padding: const EdgeInsets.only(left: 18, right: 18),
              alignment: Alignment.center,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSpacing.sizeBoxHt100,
                    enterMobileNumberWidget(),
                    AppSpacing.sizeBoxHt300,
                    CustomButton(
                      buttonColor: AppColors.persianGreen,
                      borderRadius: 4.0,
                      onPressed: _controller.text.isNotEmpty
                          ? () {
                              setState(() {
                                phoneValidationMsg =
                                    checkPhoneValidation(_controller.text);
                              });
                              if (phoneValidationMsg == null)
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OTPValidationScreen(
                                        phone: _controller.text)));
                            }
                          : null,
                      text: "Continue",
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
