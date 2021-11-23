import 'package:doctor_bima/presentation/dashboard/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_base.dart';

class DoctorDetailsScreenPage extends TestBase {
  final WidgetTester tester;
  DoctorDetailsScreenPage(this.tester);

  final saveEditBttn =
      find.byKey(const Key("doctor_details_screen_button_edit_save"));

  Future<void> clickEditButton() async {
    await tester.tap(saveEditBttn);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> editTextFields() async {
    final firstNameInput =
        find.byKey(const Key("doctor_details_screen_textfield_firstname"));
    await tester.tap(firstNameInput);
    await tester.enterText(firstNameInput, "Rajesh");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final lastNameInput =
        find.byKey(const Key("doctor_details_screen_textfield_lastname"));
    await tester.tap(lastNameInput);
    await tester.enterText(lastNameInput, "Patil");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final contactNoInput =
        find.byKey(const Key("doctor_details_screen_textfield_contact_no"));
    await tester.tap(contactNoInput);
    await tester.enterText(contactNoInput, "7020398113");
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.tap(saveEditBttn);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> navigateToHomeScreen() async {
    final arrowBackBttn =
        find.byKey(const Key("doctor_details_screen_button_arrow_back"));
    await tester.tap(arrowBackBttn);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.dragUntilVisible(
        find.text("Amir"), find.byType(ListTile).first, const Offset(0, 250),
        duration: Duration(seconds: 10));
    await tester.pumpAndSettle(const Duration(seconds: 10));
    expect(find.byType(HomeScreen), findsOneWidget);
  }
}
