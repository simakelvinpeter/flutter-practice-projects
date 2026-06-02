class Message {
  const Message({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.timestamp,
  });

  final String senderId;
  final String receiverId;
  final String text;
  final DateTime timestamp;
}
