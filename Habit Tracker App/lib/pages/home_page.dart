import 'package:flutter/material.dart';

import '../components/habit_dialog.dart';
import '../components/habit_tile.dart';
import '../models/habit.dart';
import '../models/habit_database.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void createHabit(BuildContext context) {
    final database = HabitScope.of(context);

    showDialog<void>(
      context: context,
      builder: (context) => HabitDialog(
        title: 'New Habit',
        buttonText: 'Add',
        onSave: database.addHabit,
      ),
    );
  }

  void editHabit(BuildContext context, Habit habit) {
    final database = HabitScope.of(context);

    showDialog<void>(
      context: context,
      builder: (context) => HabitDialog(
        title: 'Edit Habit',
        buttonText: 'Save',
        initialText: habit.name,
        onSave: (text) => database.updateHabit(habit, text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final database = HabitScope.of(context);
    final habits = database.currentHabits;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text('Habit Tracker'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () => createHabit(context),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${database.completedCount} of ${habits.length} habits complete',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: database.progress,
                    minHeight: 10,
                    color: Colors.black,
                    backgroundColor: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: habits.isEmpty
                  ? Center(
                      child: Text(
                        'No habits yet',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  : ListView(
                      children: habits
                          .map(
                            (habit) => HabitTile(
                              habit: habit,
                              onChanged: (value) => database
                                  .updateHabitCompletion(habit, value ?? false),
                              onEdit: () => editHabit(context, habit),
                              onDelete: () => database.deleteHabit(habit),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
