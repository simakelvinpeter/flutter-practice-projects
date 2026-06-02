class Habit {
  Habit({required this.id, required this.name, this.completedToday = false});

  final int id;
  String name;
  bool completedToday;
}
