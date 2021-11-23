import 'package:doctor_bima/presentation/dashboard/long_press_screen.dart';
import 'package:doctor_bima/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_base.dart';

class LongPressScreenPage extends TestBase {
  final WidgetTester tester;
  LongPressScreenPage(this.tester);

  Future<void> navigateToLongPressScreen() async {
    expect(find.byType(FloatingActionButton), findsWidgets);
    final longPressBttn =
        find.byKey(const Key("home_screen_button_long_press"));
    await tester.tap(longPressBttn);
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }

  Future<void> longPressOnTile() async {
    expect(find.byType(LongPressScreen), findsOneWidget);
    Finder textFind = find.text("List of Cities");
    expect(textFind, findsOneWidget);
    Text text = tester.firstWidget(textFind);
    expect(text.style.color, AppColors.black);
    await tester.pumpAndSettle(const Duration(seconds: 4));
    final Finder firstListTile =
        find.byType(ListTile, skipOffstage: false).first;
    await tester.longPress(firstListTile);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> alertPopMenu() async {
    Finder menuText = find.text("test1");
    expect(menuText, findsOneWidget);
    await tester.tap(menuText);
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }

  Future<void> pressBackArrowButton() async {
    final longPressArrowBackBttn =
        find.byKey(const Key("long_press_screen_button_arrow_back"));
    await tester.tap(longPressArrowBackBttn);
    await tester.pumpAndSettle(const Duration(seconds: 10));
  }
}
