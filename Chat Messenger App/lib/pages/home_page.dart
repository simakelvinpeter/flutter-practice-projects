import 'package:flutter/material.dart';

import '../components/user_tile.dart';
import '../models/chat_service.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatService = ChatScope.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text('Messages'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ...chatService.users.map(
              (user) => UserTile(
                user: user,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => ChatPage(receiver: user),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
