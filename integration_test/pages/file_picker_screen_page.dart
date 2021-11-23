import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_base.dart';

class FilePickerScreenPage extends TestBase {
  final WidgetTester tester;
  FilePickerScreenPage(this.tester);

  Future<void> navigateToFilePikcerScreen() async {
    expect(find.byType(FloatingActionButton), findsWidgets);
    final fileUploadBttn =
        find.byKey(const Key("home_screen_button_file_upload"));
    await tester.tap(fileUploadBttn);
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }

  Future<void> uploadFile() async {
    final pickFileBttn =
        find.byKey(const Key("file_picker_screen_button_pick_file"));
    await tester.tap(pickFileBttn);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> pressBackArrowButton() async {
    final filePickerArrowBackBttn =
        find.byKey(const Key("file_picker_screen_button_arrow_back"));
    await tester.tap(filePickerArrowBackBttn);
    await tester.pumpAndSettle(const Duration(seconds: 10));
  }
}
