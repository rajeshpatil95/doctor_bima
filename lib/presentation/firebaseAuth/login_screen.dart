import 'package:doctor_bima/bloc/login/login_bloc.dart';
import 'package:doctor_bima/bloc/login/login_event.dart';
import 'package:doctor_bima/bloc/login/login_state.dart';
import 'package:doctor_bima/components/custom_button.dart';
import 'package:doctor_bima/generated/l10n.dart';
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

    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });

    BlocProvider.of<LoginBloc>(context)
        .add(CheckIfUserAuthenticatedEvent(context: context));
  }

  String checkPhoneValidation(String value) {
    //TODO commenting beacuse this "9999999999" will always throw invalid number

    // Pattern pattern = r"^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$";
    Pattern pattern = r"";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty)
      return Strings.of(context).cannotBeEmpty;
    else if (!regex.hasMatch(value))
      return Strings.of(context).enterValidPhone;
    else
      return null;
  }

  Widget enterMobileNumberWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Strings.of(context).enterYourMobileNumber,
            key: const Key("login_screen_text_enter_your_mobile_number"),
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
              key: const Key("login_screen_textfield_phone_number"),
              autocorrect: true,
              controller: _controller,
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
                hintText: Strings.of(context).phoneNumber,
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
                      setState(() {
                        _controller.clear();
                      });
                    }),
              ),
            )),
        phoneValidationMsg != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppSpacing.sizeBoxHt10,
                  Text(Strings.of(context).pleaseEnterValidPhone,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: AppFontSize.small,
                          color: AppColors.errorColor)),
                ],
              )
            : Container(),
        AppSpacing.sizeBoxHt10,
        Text(Strings.of(context).weWillSendOtp,
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
                content: Text(
              Strings.of(context).somethingWentWrong,
            )));
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
              child: Text(Strings.of(context).hangOn,
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
                      key: const Key("login_screen_button_continue"),
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
                      text: Strings.of(context).continueStr,
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
