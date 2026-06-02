import 'comment.dart';

class Post {
  Post({
    required this.id,
    required this.user,
    required this.message,
    this.likes = 0,
    List<Comment>? comments,
  }) : comments = comments ?? [];

  final int id;
  final String user;
  String message;
  int likes;
  final List<Comment> comments;
  bool likedByMe = false;
}
