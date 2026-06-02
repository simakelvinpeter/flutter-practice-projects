import 'package:flutter/material.dart';

class SneakerImage extends StatelessWidget {
  const SneakerImage({
    super.key,
    required this.colors,
    this.imagePath,
    this.height = 150,
  });

  final List<Color> colors;
  final String? imagePath;
  final double height;

  @override
  Widget build(BuildContext context) {
    final path = imagePath;

    if (path != null) {
      return SizedBox(
        height: height,
        width: height * 1.55,
        child: Image.asset(path, fit: BoxFit.contain),
      );
    }

    return SizedBox(
      height: height,
      width: height * 1.55,
      child: CustomPaint(painter: _SneakerPainter(colors)),
    );
  }
}

class _SneakerPainter extends CustomPainter {
  const _SneakerPainter(this.colors);

  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.12)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    final bodyPaint = Paint()
      ..shader = LinearGradient(
        colors: [colors[0], colors[1].withValues(alpha: 0.75)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Offset.zero & size);

    final solePaint = Paint()..color = Colors.white;
    final accentPaint = Paint()..color = colors[2];
    final lacePaint = Paint()
      ..color = Colors.grey.shade700
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final shadow = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.13,
        size.height * 0.75,
        size.width * 0.74,
        size.height * 0.1,
      ),
      const Radius.circular(24),
    );
    canvas.drawRRect(shadow, shadowPaint);

    final body = Path()
      ..moveTo(size.width * 0.08, size.height * 0.62)
      ..quadraticBezierTo(
        size.width * 0.24,
        size.height * 0.28,
        size.width * 0.44,
        size.height * 0.36,
      )
      ..quadraticBezierTo(
        size.width * 0.61,
        size.height * 0.43,
        size.width * 0.7,
        size.height * 0.33,
      )
      ..quadraticBezierTo(
        size.width * 0.78,
        size.height * 0.24,
        size.width * 0.82,
        size.height * 0.38,
      )
      ..quadraticBezierTo(
        size.width * 0.86,
        size.height * 0.54,
        size.width * 0.95,
        size.height * 0.61,
      )
      ..quadraticBezierTo(
        size.width * 0.73,
        size.height * 0.76,
        size.width * 0.17,
        size.height * 0.73,
      )
      ..quadraticBezierTo(
        size.width * 0.08,
        size.height * 0.71,
        size.width * 0.08,
        size.height * 0.62,
      )
      ..close();
    canvas.drawPath(body, bodyPaint);

    final sole = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.1,
        size.height * 0.66,
        size.width * 0.82,
        size.height * 0.12,
      ),
      const Radius.circular(20),
    );
    canvas.drawRRect(sole, solePaint);

    final swoosh = Path()
      ..moveTo(size.width * 0.36, size.height * 0.58)
      ..quadraticBezierTo(
        size.width * 0.52,
        size.height * 0.65,
        size.width * 0.75,
        size.height * 0.48,
      )
      ..quadraticBezierTo(
        size.width * 0.57,
        size.height * 0.72,
        size.width * 0.31,
        size.height * 0.63,
      )
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.61,
        size.width * 0.36,
        size.height * 0.58,
      )
      ..close();
    canvas.drawPath(swoosh, accentPaint);

    for (var i = 0; i < 4; i++) {
      final x = size.width * (0.36 + i * 0.07);
      canvas.drawLine(
        Offset(x, size.height * 0.47),
        Offset(x + size.width * 0.08, size.height * 0.56),
        lacePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _SneakerPainter oldDelegate) =>
      oldDelegate.colors != colors;
}
