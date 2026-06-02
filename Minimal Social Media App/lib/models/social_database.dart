import 'package:flutter/material.dart';

import 'comment.dart';
import 'post.dart';

class SocialDatabase extends ChangeNotifier {
  final List<Post> posts = [
    Post(
      id: 1,
      user: 'Alex',
      message: 'Working on my Flutter masterclass projects today.',
      likes: 4,
      comments: const [Comment(user: 'Sam', text: 'Nice progress!')],
    ),
    Post(
      id: 2,
      user: 'Sarah',
      message: 'Minimal UI makes apps feel so clean.',
      likes: 7,
    ),
  ];

  int _nextId = 3;

  void addPost(String message) {
    if (message.trim().isEmpty) return;

    posts.insert(0, Post(id: _nextId, user: 'You', message: message.trim()));
    _nextId++;
    notifyListeners();
  }

  void toggleLike(Post post) {
    post.likedByMe = !post.likedByMe;
    post.likes += post.likedByMe ? 1 : -1;
    notifyListeners();
  }

  void addComment(Post post, String text) {
    if (text.trim().isEmpty) return;

    post.comments.add(Comment(user: 'You', text: text.trim()));
    notifyListeners();
  }

  void deletePost(Post post) {
    posts.remove(post);
    notifyListeners();
  }
}

class SocialScope extends InheritedNotifier<SocialDatabase> {
  const SocialScope({
    super.key,
    required SocialDatabase database,
    required super.child,
  }) : super(notifier: database);

  static SocialDatabase of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SocialScope>();
    assert(scope != null, 'No SocialScope found in context');
    return scope!.notifier!;
  }
}
