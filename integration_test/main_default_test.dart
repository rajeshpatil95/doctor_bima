import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:doctor_bima/main/main_dev.dart' as launchApp;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Testing login_screen E2E", (WidgetTester tester) async {
    launchApp.main();
    await tester.pumpAndSettle(const Duration(seconds: 4));

    var phoneInput =
        find.byKey(const Key("login_screen_textfield_phone_number"));
    await tester.tap(phoneInput);
    await tester.enterText(phoneInput, "7020398113");
    await tester.pumpAndSettle(const Duration(seconds: 2));

    var continueBttn = find.byKey(const Key("login_screen_button_continue"));
    await tester.tap(continueBttn);
    await tester.pumpAndSettle(const Duration(seconds: 4));
  });
}