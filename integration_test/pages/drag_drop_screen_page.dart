import 'package:doctor_bima/presentation/dashboard/drag_drop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_base.dart';

class DragDropScreenPage extends TestBase {
  final WidgetTester tester;
  DragDropScreenPage(this.tester);

  Future<void> navigateToDragDropScreen() async {
    expect(find.byType(FloatingActionButton), findsWidgets);
    final dragDropBttn = find.byKey(const Key("home_screen_button_drag_drop"));
    await tester.tap(dragDropBttn);
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }

  Future<void> dragDropContainer() async {
    expect(find.byType(DragDropScreen), findsOneWidget);
    final dragDropContainer =
        find.byKey(const Key("drag_drop_screen_button_container"));
    await tester.timedDrag(
        dragDropContainer, Offset(500, 300), Duration(seconds: 2));
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> pressBackArrowButton() async {
    final dragDropArrowBackBttn =
        find.byKey(const Key("drag_drop_screen_button_arrow_back"));
    await tester.tap(dragDropArrowBackBttn);
    await tester.pumpAndSettle(const Duration(seconds: 10));
  }
}
