import 'package:doctor_bima/presentation/dashboard/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_base.dart';

class OTPValidationScreenPage extends TestBase {
  final WidgetTester tester;
  OTPValidationScreenPage(this.tester);

  Future<void> enterPinInput() async {
    final pinInput = find.byKey(const Key('otp_validation_screen_pinInput'));
    await tester.tap(pinInput);
    await tester.enterText(pinInput, "123456");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> CheckboxChecking() async {
    final checkboxBttn =
        find.byKey(const Key("otp_validation_screen_checkbox_t&c"));
    expect(
        tester.getSemantics(checkboxBttn),
        matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: false,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true));
    await tester.tap(checkboxBttn);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(
        tester.getSemantics(checkboxBttn),
        matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: true,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true));
  }

  Future<void> clickLoginButton() async {
    final loginBttn =
        find.byKey(const Key("otp_validation_screen_button_login"));
    await tester.tap(loginBttn);
    await tester.pumpAndSettle(const Duration(seconds: 4));
    expect(find.byType(HomeScreen), findsOneWidget);
  }
}
