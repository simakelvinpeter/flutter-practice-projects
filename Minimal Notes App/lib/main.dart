import 'package:flutter/material.dart';

import 'models/note_database.dart';
import 'pages/notes_page.dart';

void main() {
  runApp(NoteScope(database: NoteDatabase(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minimal Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade900),
        scaffoldBackgroundColor: Colors.grey[300],
        useMaterial3: true,
      ),
      home: const NotesPage(),
    );
  }
}
