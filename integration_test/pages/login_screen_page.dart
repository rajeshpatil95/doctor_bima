import 'dart:io';
import 'package:doctor_bima/presentation/firebaseAuth/otp_validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_base.dart';

class LoginScreenPage extends TestBase {
  final WidgetTester tester;
  LoginScreenPage(this.tester);

  Future<void> enterPhoneNumber() async {
    final phoneInput =
        find.byKey(const Key("login_screen_textfield_phone_number"));
    await tester.tap(phoneInput);
    await tester.enterText(phoneInput, "7020398113");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> clickContinueButton() async {
    final continueBttn = find.byKey(const Key("login_screen_button_continue"));
    await tester.tap(continueBttn);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(OTPValidationScreen), findsOneWidget);
  }
}

class FinderType extends Finder {
  FinderType(this.finder, this.key);

  final Finder finder;
  final Key key;

  @override
  Iterable<Element> apply(Iterable<Element> candidates) {
    return finder.apply(candidates);
  }

  @override
  String get description => finder.description;

  Finder get title => find.descendant(of: this, matching: find.byKey(key));
}
