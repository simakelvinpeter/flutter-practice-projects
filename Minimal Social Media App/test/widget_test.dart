import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_social_media_app/main.dart';
import 'package:minimal_social_media_app/models/social_database.dart';

void main() {
  testWidgets('creates a social post', (tester) async {
    await tester.pumpWidget(
      SocialScope(database: SocialDatabase(), child: const MyApp()),
    );

    expect(find.text('Minimal Social'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'My first post');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    expect(find.text('My first post'), findsOneWidget);
  });
}
