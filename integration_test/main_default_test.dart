import 'package:doctor_bima/presentation/dashboard/doctor_details_screen.dart';
import 'package:doctor_bima/presentation/dashboard/home_screen.dart';
import 'package:doctor_bima/presentation/firebaseAuth/otp_validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:doctor_bima/main/main_dev.dart' as launchApp;

void main() async {
  // convenience flutter testing gives us an ability to set stuff up before and after cleanup
  setUpAll(() {
    // This is called once before ALL test
  });

  setUp(() {
    //This is called once before EVERY test
  });

  tearDownAll(() {
    //This is called once after ALL test
  });

  tearDown(() {
    //This si called once after EVERY test
  });

  group("DoctorBimaApp Test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Testing DoctorBimaApp E2E", (WidgetTester tester) async {
      launchApp.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //login_screen
      final phoneInput =
          find.byKey(const Key("login_screen_textfield_phone_number"));
      await tester.tap(phoneInput);
      await tester.enterText(phoneInput, "7020398113");
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final continueBttn =
          find.byKey(const Key("login_screen_button_continue"));
      await tester.tap(continueBttn);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(OTPValidationScreen), findsOneWidget);

      //otp_validation_screen
      final pinInput = find.byKey(const Key('otp_validation_screen_pinInput'));
      await tester.tap(pinInput);
      await tester.enterText(pinInput, "123456");
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 2));

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

      final loginBttn =
          find.byKey(const Key("otp_validation_screen_button_login"));
      await tester.tap(loginBttn);
      await tester.pumpAndSettle(const Duration(seconds: 4));
      expect(find.byType(HomeScreen), findsOneWidget);

      //file_picker_screen
      expect(find.byType(FloatingActionButton), findsOneWidget);
      final fileUploadBttn =
          find.byKey(const Key("home_screen_button_file_upload"));
      await tester.tap(fileUploadBttn);
      await tester.pumpAndSettle(const Duration(seconds: 4));

      final pickFileBttn =
          find.byKey(const Key("file_picker_screen_button_pick_file"));
      await tester.tap(pickFileBttn);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final filePickerArrowBackBttn =
          find.byKey(const Key("file_picker_screen_button_arrow_back"));
      await tester.tap(filePickerArrowBackBttn);
      await tester.pumpAndSettle(const Duration(seconds: 10));

      //home_screen
      final detailTile = find.byType(ListTile).first;
      await tester.dragUntilVisible(
          find.text("Madhuri"),
          find.byType(ListTile).first, // widget you want to scroll
          const Offset(-250, 0),
          duration: Duration(seconds: 10) // delta to move
          );
      await tester.tap(detailTile);
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(DoctorDetailsScreen), findsOneWidget);

      //doctor_details_screen
      final saveEditBttn =
          find.byKey(const Key("doctor_details_screen_button_edit_save"));
      await tester.tap(saveEditBttn);
      await tester.pumpAndSettle(const Duration(seconds: 2));

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

      final arrowBackBttn =
          find.byKey(const Key("doctor_details_screen_button_arrow_back"));
      await tester.tap(arrowBackBttn);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.dragUntilVisible(
          find.text("Amir"), find.byType(ListTile).first, const Offset(0, 250),
          duration: Duration(seconds: 10));
      await tester.pumpAndSettle(const Duration(seconds: 10));
      expect(find.byType(HomeScreen), findsOneWidget);
    }, skip: false);
  });
}
