import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_notes_app/main.dart';
import 'package:minimal_notes_app/models/note_database.dart';

void main() {
  testWidgets('creates a new note', (tester) async {
    await tester.pumpWidget(
      NoteScope(database: NoteDatabase(), child: const MyApp()),
    );

    expect(find.text('Notes'), findsOneWidget);
    await tester.pumpAndSettle();

    expect(find.text('No notes yet'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Study Flutter widgets');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    expect(find.text('Study Flutter widgets'), findsOneWidget);
  });
}
