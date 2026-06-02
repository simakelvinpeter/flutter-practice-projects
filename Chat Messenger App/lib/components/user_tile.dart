import 'package:flutter/material.dart';

import '../models/app_user.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user, required this.onTap});

  final AppUser user;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[900],
            child: Text(
              user.name[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(user.name),
          subtitle: Text(user.email),
        ),
      ),
    );
  }
}
