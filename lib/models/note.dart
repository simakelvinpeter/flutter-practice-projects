import 'package:isar_db/isar_db.dart';

part 'note.g.dart';

@collection
class Note {
  int id = 0;

  String text = '';

  DateTime createdAt = DateTime.now();
}
