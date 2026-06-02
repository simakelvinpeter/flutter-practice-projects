import 'package:flutter/material.dart';

import 'app_user.dart';
import 'message.dart';

class ChatService extends ChangeNotifier {
  final AppUser currentUser = const AppUser(
    id: 'me',
    name: 'You',
    email: 'you@email.com',
  );

  final List<AppUser> users = const [
    AppUser(id: 'alex', name: 'Alex Morgan', email: 'alex@email.com'),
    AppUser(id: 'sarah', name: 'Sarah Lee', email: 'sarah@email.com'),
    AppUser(id: 'mike', name: 'Mike Chen', email: 'mike@email.com'),
  ];

  final List<Message> _messages = [
    Message(
      senderId: 'alex',
      receiverId: 'me',
      text: 'Hey, how is the Flutter project going?',
      timestamp: DateTime(2026, 6, 2, 9, 20),
    ),
    Message(
      senderId: 'me',
      receiverId: 'alex',
      text: 'Pretty good. I am building the chat app now.',
      timestamp: DateTime(2026, 6, 2, 9, 22),
    ),
  ];

  List<Message> messagesWith(String userId) {
    return _messages
        .where(
          (message) =>
              (message.senderId == currentUser.id &&
                  message.receiverId == userId) ||
              (message.senderId == userId &&
                  message.receiverId == currentUser.id),
        )
        .toList();
  }

  void sendMessage(String receiverId, String text) {
    if (text.trim().isEmpty) return;

    _messages.add(
      Message(
        senderId: currentUser.id,
        receiverId: receiverId,
        text: text.trim(),
        timestamp: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}

class ChatScope extends InheritedNotifier<ChatService> {
  const ChatScope({
    super.key,
    required ChatService service,
    required super.child,
  }) : super(notifier: service);

  static ChatService of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ChatScope>();
    assert(scope != null, 'No ChatScope found in context');
    return scope!.notifier!;
  }
}
