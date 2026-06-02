import 'package:flutter/material.dart';

import '../models/post.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    required this.post,
    required this.onLike,
    required this.onComment,
    required this.onDelete,
  });

  final Post post;
  final void Function() onLike;
  final void Function() onComment;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[900],
                child: Text(
                  post.user[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  post.user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              if (post.user == 'You')
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: onDelete,
                ),
            ],
          ),
          const SizedBox(height: 14),
          Text(post.message, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  post.likedByMe ? Icons.favorite : Icons.favorite_border,
                  color: post.likedByMe ? Colors.red : Colors.grey[800],
                ),
                onPressed: onLike,
              ),
              Text('${post.likes}'),
              const SizedBox(width: 18),
              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: onComment,
              ),
              Text('${post.comments.length}'),
            ],
          ),
          if (post.comments.isNotEmpty) ...[
            const Divider(),
            ...post.comments.map(
              (comment) => Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  '${comment.user}: ${comment.text}',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
