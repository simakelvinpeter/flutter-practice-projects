import 'package:flutter/material.dart';

import '../components/comment_dialog.dart';
import '../components/my_text_field.dart';
import '../components/post_tile.dart';
import '../models/post.dart';
import '../models/social_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final postController = TextEditingController();

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  void addComment(BuildContext context, Post post) {
    final database = SocialScope.of(context);

    showDialog<void>(
      context: context,
      builder: (context) =>
          CommentDialog(onSave: (text) => database.addComment(post, text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final database = SocialScope.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text('Minimal Social'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    controller: postController,
                    hintText: 'Say something...',
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      database.addPost(postController.text);
                      postController.clear();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: database.posts
                    .map(
                      (post) => PostTile(
                        post: post,
                        onLike: () => database.toggleLike(post),
                        onComment: () => addComment(context, post),
                        onDelete: () => database.deletePost(post),
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
