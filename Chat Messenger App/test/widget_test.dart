import 'package:chat_messenger_app/main.dart';
import 'package:chat_messenger_app/models/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('logs in and sends a message', (tester) async {
    await tester.pumpWidget(
      ChatScope(service: ChatService(), child: const MyApp()),
    );

    expect(find.text('Welcome back'), findsOneWidget);

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Chats'), findsOneWidget);

    await tester.tap(find.text('Alex Morgan'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Hello Alex');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    expect(find.text('Hello Alex'), findsOneWidget);
  });
}
