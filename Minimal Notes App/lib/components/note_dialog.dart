import 'dart:async';

import 'package:flutter/material.dart';

class NoteDialog extends StatefulWidget {
  const NoteDialog({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onSave,
    this.initialText = '',
  });

  final String title;
  final String buttonText;
  final String initialText;
  final FutureOr<void> Function(String text) onSave;

  @override
  State<NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
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
        minLines: 1,
        maxLines: 5,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Write a note...',
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
          onPressed: () async {
            final navigator = Navigator.of(context);
            await widget.onSave(controller.text);
            if (!mounted) return;
            navigator.pop();
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
