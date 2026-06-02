import 'package:flutter/material.dart';

class HabitDialog extends StatefulWidget {
  const HabitDialog({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onSave,
    this.initialText = '',
  });

  final String title;
  final String buttonText;
  final String initialText;
  final void Function(String text) onSave;

  @override
  State<HabitDialog> createState() => _HabitDialogState();
}

class _HabitDialogState extends State<HabitDialog> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      title: Text(widget.title),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Habit name',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        MaterialButton(
          color: Colors.black,
          onPressed: () {
            widget.onSave(controller.text);
            Navigator.pop(context);
          },
          child: Text(
            widget.buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
