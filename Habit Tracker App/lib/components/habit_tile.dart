import 'package:flutter/material.dart';

import '../models/habit.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({
    super.key,
    required this.habit,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  final Habit habit;
  final void Function(bool? value) onChanged;
  final void Function() onEdit;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: Checkbox(
            value: habit.completedToday,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          title: Text(
            habit.name,
            style: TextStyle(
              fontSize: 16,
              decoration: habit.completedToday
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: habit.completedToday ? Colors.grey[600] : Colors.black,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: onEdit,
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
