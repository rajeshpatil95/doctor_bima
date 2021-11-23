import 'package:doctor_bima/presentation/dashboard/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_base.dart';

class HomeScreenPage extends TestBase {
  final WidgetTester tester;
  HomeScreenPage(this.tester);

  Future<void> navigateToDoctorDetailsScreen() async {
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
  }
}
