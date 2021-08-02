import 'package:doctor_bima/components/custom_button.dart';
import 'package:doctor_bima/di/di_initializer.dart';
import 'package:doctor_bima/navigation/routes.dart';
import 'package:doctor_bima/storage/shared_preferences.dart';
import 'package:doctor_bima/style/app_colors.dart';
import 'package:doctor_bima/style/font.dart';
import 'package:doctor_bima/style/spacing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPValidationScreen extends StatefulWidget {
  final String phone;
  const OTPValidationScreen({Key key, this.phone}) : super(key: key);

  @override
  _OTPValidationScreenState createState() => _OTPValidationScreenState();
}

class _OTPValidationScreenState extends State<OTPValidationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
      color: AppColors.primaryDark, borderRadius: BorderRadius.circular(5.0));
  bool termsAndCondition = false;
  String pinText;
  String _verificationCode;

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.popAndPushNamed(context, Routes.homeScreen);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  Widget enterOTPWidget() {
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
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: PinPut(
            fieldsCount: 6,
            textStyle: const TextStyle(fontSize: 25.0, color: AppColors.accent),
            eachFieldWidth: 40.0,
            eachFieldHeight: 55.0,
            focusNode: _pinPutFocusNode,
            controller: _pinPutController,
            submittedFieldDecoration: pinPutDecoration,
            selectedFieldDecoration: pinPutDecoration,
            followingFieldDecoration: pinPutDecoration,
            pinAnimationType: PinAnimationType.fade,
            // onSubmit: (pin) async {
            //   setState(() {
            //     pinText = pin;
            //   });
            // },
            onChanged: (pin) {
              setState(() {
                pinText = pin;
              });
            },
          ),
        ),
        AppSpacing.sizeBoxHt10,
        Text(
            "Please enter the verification code that was sent to ${widget.phone}",
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
        body: Container(
          padding: const EdgeInsets.only(left: 18, right: 18),
          alignment: Alignment.center,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSpacing.sizeBoxHt100,
                enterOTPWidget(),
                AppSpacing.sizeBoxHt300,
                CustomButton(
                  buttonColor: AppColors.persianGreen,
                  borderRadius: 4.0,
                  onPressed: termsAndCondition
                      ? () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
                                        verificationId: _verificationCode,
                                        smsCode: pinText))
                                .then((value) async {
                              if (value.user != null) {
                                await DI.inject<Preferences>().setStringForKey(
                                    preferencesKeys.kUserAuthToken,
                                    value.user.getIdToken().toString());

                                Navigator.popAndPushNamed(
                                    context, Routes.homeScreen);
                              }
                            });
                          } catch (e) {
                            FocusScope.of(context).unfocus();
                            _scaffoldkey.currentState.showSnackBar(
                                SnackBar(content: Text('invalid OTP')));
                          }
                        }
                      : null,
                  text: "Login",
                ),
                AppSpacing.sizeBoxHt10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: termsAndCondition,
                        activeColor: AppColors.persianGreen,
                        onChanged: (bool newValue) {
                          setState(() {
                            termsAndCondition = newValue;
                          });
                        }),
                    Flexible(
                        child: Text(
                            'I agree to the Terms Of Use and Privacy Policy')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
