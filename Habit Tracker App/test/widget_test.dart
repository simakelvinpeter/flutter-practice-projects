import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker_app/main.dart';
import 'package:habit_tracker_app/models/habit_database.dart';

void main() {
  testWidgets('adds and completes a habit', (tester) async {
    await tester.pumpWidget(
      HabitScope(database: HabitDatabase(), child: const MyApp()),
    );

    expect(find.text('Habit Tracker'), findsOneWidget);
    expect(find.text('Exercise'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Meditate');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    expect(find.text('Meditate'), findsOneWidget);

    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();

    expect(find.text('1 of 4 habits complete'), findsOneWidget);
  });
}
