import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:doctor_bima/main/main_dev.dart' as launchApp;
import '../pages/doctor_details_screen_page.dart';
import '../pages/drag_drop_screen_page.dart';
import '../pages/file_picker_screen_page.dart';
import '../pages/home_screen_page.dart';
import '../pages/login_screen_page.dart';
import '../pages/long_press_screen_page.dart';
import '../pages/otp_validation_screen_page.dart';

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

  //Initialize page objects
  LoginScreenPage loginScreenPage;
  OTPValidationScreenPage otpValidationSreenPage;
  HomeScreenPage homeScreenPage;
  LongPressScreenPage longPressScreenPage;
  DragDropScreenPage dragDropScreenPage;
  FilePickerScreenPage filePickerScreenPage;
  DoctorDetailsScreenPage doctorDetailsScreenPage;

  group("DoctorBimaApp Test", () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;
    testWidgets("Testing DoctorBimaApp E2E", (WidgetTester tester) async {
      launchApp.main();
      //Creating page instances
      loginScreenPage = LoginScreenPage(tester);
      otpValidationSreenPage = OTPValidationScreenPage(tester);
      homeScreenPage = HomeScreenPage(tester);
      longPressScreenPage = LongPressScreenPage(tester);
      dragDropScreenPage = DragDropScreenPage(tester);
      filePickerScreenPage = FilePickerScreenPage(tester);
      doctorDetailsScreenPage = DoctorDetailsScreenPage(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //login_screen
      await loginScreenPage.enterPhoneNumber();
      await loginScreenPage.clickContinueButton();

      //otp_validation_screen
      await otpValidationSreenPage.enterPinInput();
      await otpValidationSreenPage.CheckboxChecking();
      await otpValidationSreenPage.clickLoginButton();

      //long_press_screen
      await longPressScreenPage.navigateToLongPressScreen();
      await longPressScreenPage.longPressOnTile();
      await longPressScreenPage.alertPopMenu();
      await longPressScreenPage.pressBackArrowButton();

      //drap_drop_screen
      await dragDropScreenPage.navigateToDragDropScreen();
      await dragDropScreenPage.dragDropContainer();
      await dragDropScreenPage.pressBackArrowButton();

      //file_picker_screen
      await filePickerScreenPage.navigateToFilePikcerScreen();
      await filePickerScreenPage.uploadFile();
      await filePickerScreenPage.pressBackArrowButton();

      //home_screen
      await homeScreenPage.navigateToDoctorDetailsScreen();

      //doctor_details_screen
      await doctorDetailsScreenPage.clickEditButton();
      await doctorDetailsScreenPage.editTextFields();
      await doctorDetailsScreenPage.navigateToHomeScreen();
    }, skip: false);
  });
}
