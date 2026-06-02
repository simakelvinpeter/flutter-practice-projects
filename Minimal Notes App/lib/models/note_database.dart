import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:isar_db/isar_db.dart';
import 'package:path_provider/path_provider.dart';

import 'note.dart';

class NoteDatabase extends ChangeNotifier {
  static Isar? _isar;
  bool _usingMemoryFallback = false;
  int _nextMemoryId = 1;

  final List<Note> currentNotes = [];

  List<Note> get notes => List.unmodifiable(currentNotes);

  Future<void> initialize() async {
    if (_usingMemoryFallback) return;

    if (_isar != null) {
      await fetchNotes();
      return;
    }

    final directory = kIsWeb
        ? ''
        : (await getApplicationDocumentsDirectory()).path;

    try {
      _isar = await Isar.openAsync(schemas: [NoteSchema], directory: directory);
    } catch (_) {
      _usingMemoryFallback = true;
      notifyListeners();
      return;
    }

    await fetchNotes();
  }

  // C R E A T E - a note and save to db
  Future<void> addNote(String text) async {
    if (text.trim().isEmpty) return;
    await initialize();

    if (_usingMemoryFallback) {
      currentNotes.insert(
        0,
        Note()
          ..id = _nextMemoryId++
          ..text = text.trim()
          ..createdAt = DateTime.now(),
      );
      notifyListeners();
      return;
    }

    final newNote = Note()
      ..id = _isar!.notes.autoIncrement()
      ..text = text.trim()
      ..createdAt = DateTime.now();

    await _isar!.writeAsync((isar) {
      isar.notes.put(newNote);
    });

    await fetchNotes();
  }

  // R E A D - notes from db
  Future<void> fetchNotes() async {
    if (_isar == null) return;

    final fetchedNotes = _isar!.notes.where().sortByCreatedAtDesc().findAll();

    currentNotes
      ..clear()
      ..addAll(fetchedNotes);

    notifyListeners();
  }

  // U P D A T E - a note in db
  Future<void> updateNote(Note note, String text) async {
    if (text.trim().isEmpty) return;
    await initialize();

    if (_usingMemoryFallback) {
      note.text = text.trim();
      notifyListeners();
      return;
    }

    note.text = text.trim();

    await _isar!.writeAsync((isar) {
      isar.notes.put(note);
    });

    await fetchNotes();
  }

  // D E L E T E - a note from the db
  Future<void> deleteNote(int id) async {
    await initialize();

    if (_usingMemoryFallback) {
      currentNotes.removeWhere((note) => note.id == id);
      notifyListeners();
      return;
    }

    await _isar!.writeAsync((isar) {
      isar.notes.delete(id);
    });

    await fetchNotes();
  }
}

class NoteScope extends InheritedNotifier<NoteDatabase> {
  const NoteScope({
    super.key,
    required NoteDatabase database,
    required super.child,
  }) : super(notifier: database);

  static NoteDatabase of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<NoteScope>();
    assert(scope != null, 'No NoteScope found in context');
    return scope!.notifier!;
  }
}
