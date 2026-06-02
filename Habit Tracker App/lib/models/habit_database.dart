import 'package:flutter/material.dart';

import 'habit.dart';

class HabitDatabase extends ChangeNotifier {
  final List<Habit> currentHabits = [
    Habit(id: 1, name: 'Exercise'),
    Habit(id: 2, name: 'Read'),
    Habit(id: 3, name: 'Drink water'),
  ];

  int _nextId = 4;

  int get completedCount =>
      currentHabits.where((habit) => habit.completedToday).length;

  double get progress {
    if (currentHabits.isEmpty) return 0;
    return completedCount / currentHabits.length;
  }

  void addHabit(String name) {
    if (name.trim().isEmpty) return;

    currentHabits.add(Habit(id: _nextId, name: name.trim()));
    _nextId++;
    notifyListeners();
  }

  void updateHabit(Habit habit, String name) {
    if (name.trim().isEmpty) return;

    habit.name = name.trim();
    notifyListeners();
  }

  void deleteHabit(Habit habit) {
    currentHabits.remove(habit);
    notifyListeners();
  }

  void updateHabitCompletion(Habit habit, bool completed) {
    habit.completedToday = completed;
    notifyListeners();
  }
}

class HabitScope extends InheritedNotifier<HabitDatabase> {
  const HabitScope({
    super.key,
    required HabitDatabase database,
    required super.child,
  }) : super(notifier: database);

  static HabitDatabase of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<HabitScope>();
    assert(scope != null, 'No HabitScope found in context');
    return scope!.notifier!;
  }
}
