import 'package:flutter/material.dart';

import '../components/note_dialog.dart';
import '../components/note_tile.dart';
import '../models/note.dart';
import '../models/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      NoteScope.of(context).initialize();
    });
  }

  void createNote(BuildContext context) {
    final database = NoteScope.of(context);

    showDialog<void>(
      context: context,
      builder: (context) => NoteDialog(
        title: 'New Note',
        buttonText: 'Add',
        onSave: (text) => database.addNote(text),
      ),
    );
  }

  void updateNote(BuildContext context, Note note) {
    final database = NoteScope.of(context);

    showDialog<void>(
      context: context,
      builder: (context) => NoteDialog(
        title: 'Edit Note',
        buttonText: 'Save',
        initialText: note.text,
        onSave: (text) => database.updateNote(note, text),
      ),
    );
  }

  void deleteNote(BuildContext context, Note note) {
    NoteScope.of(context).deleteNote(note.id);
  }

  @override
  Widget build(BuildContext context) {
    final database = NoteScope.of(context);
    final notes = database.notes;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () => createNote(context),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: notes.isEmpty
            ? Center(
                child: Text(
                  'No notes yet',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              )
            : ListView(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Your Notes',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...notes.map(
                    (note) => NoteTile(
                      note: note,
                      onTap: () => updateNote(context, note),
                      onDelete: () => deleteNote(context, note),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
