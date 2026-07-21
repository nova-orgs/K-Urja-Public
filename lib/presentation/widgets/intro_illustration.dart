import 'package:flutter/material.dart';

class IntroIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Colors
    final Paint lightLimePaint = Paint()
      ..color = const Color.fromRGBO(224, 255, 196, 0.7);
    //final Paint whitePaint = Paint()..color = Colors.white;
    final Paint outlinePaint = Paint()
      ..color = const Color.fromRGBO(0, 0, 0, 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final Paint blackPaint = Paint()..color = Colors.black;

    // Central abstract shape
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Pulsating central circles
    canvas.drawCircle(Offset(centerX, centerY), 100, lightLimePaint);
    canvas.drawCircle(
      Offset(centerX, centerY),
      80,
      Paint()..color = const Color.fromRGBO(255, 255, 255, 0.5),
    );

    // Abstract representation of savings (coins)
    // Using simple circles with a stylized 'S'
    _drawCoin(canvas, Offset(centerX - 90, centerY - 60), 20, blackPaint);
    _drawCoin(canvas, Offset(centerX + 120, centerY + 30), 15, blackPaint);
    _drawCoin(canvas, Offset(centerX - 130, centerY + 80), 18, blackPaint);

    // Abstract representation of control (paper planes)
    // Using simple triangles to represent flight/direction
    _drawPaperPlane(canvas, Offset(centerX - 150, centerY), 40, blackPaint);
    _drawPaperPlane(
      canvas,
      Offset(centerX + 150, centerY - 100),
      30,
      blackPaint,
    );

    // Abstract representation of transactions (credit card)
    // A simple rounded rectangle
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX + 90, centerY + 90),
          width: 50,
          height: 30,
        ),
        const Radius.circular(5),
      ),
      outlinePaint,
    );
    canvas.drawLine(
      Offset(centerX + 70, centerY + 85),
      Offset(centerX + 110, centerY + 85),
      outlinePaint,
    );

    // Dynamic flowing lines
    final Path flowPath = Path();
    flowPath.moveTo(0, centerY - 50);
    flowPath.quadraticBezierTo(centerX / 2, centerY - 100, centerX, centerY);
    flowPath.quadraticBezierTo(
      centerX * 1.5,
      centerY + 100,
      size.width,
      centerY + 50,
    );
    canvas.drawPath(flowPath, outlinePaint..strokeWidth = 2);

    final Path flowPath2 = Path();
    flowPath2.moveTo(0, centerY + 80);
    flowPath2.quadraticBezierTo(
      centerX / 2,
      centerY + 130,
      centerX,
      centerY + 50,
    );
    flowPath2.quadraticBezierTo(
      centerX * 1.5,
      centerY - 30,
      size.width,
      centerY,
    );
    canvas.drawPath(flowPath2, outlinePaint..strokeWidth = 1);
  }

  void _drawCoin(Canvas canvas, Offset position, double radius, Paint paint) {
    canvas.drawCircle(position, radius, paint);
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: radius * 1.2,
      fontWeight: FontWeight.bold,
    );
    final textSpan = TextSpan(text: 'S', style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      position - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  void _drawPaperPlane(
    Canvas canvas,
    Offset position,
    double size,
    Paint paint,
  ) {
    final Path planePath = Path();
    planePath.moveTo(position.dx, position.dy);
    planePath.lineTo(position.dx + size, position.dy + size / 3);
    planePath.lineTo(position.dx + size / 2, position.dy + size / 2);
    planePath.close();
    canvas.drawPath(planePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
