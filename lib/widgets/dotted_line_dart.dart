import 'package:flutter/cupertino.dart';

class DottedLinePainter extends CustomPainter {
  final double dashLength;
  final double dashGapLength;
  final double lineThickness;
  final Color lineColor;

  DottedLinePainter({
    required this.dashLength,
    required this.dashGapLength,
    required this.lineThickness,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineThickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final dash = Path()
      ..moveTo(0, 0)
      ..lineTo(dashLength, 0);
    final gap = Path()
      ..moveTo(dashLength + dashGapLength, 0)
      ..lineTo(dashLength * 2 + dashGapLength, 0);

    final totalLength = dashLength * 2 + dashGapLength;
    final totalDashes = (size.width / totalLength).floor();

    for (var i = 0; i < totalDashes; i++) {
      canvas.drawPath(dash, paint);
      canvas.drawPath(gap, paint);
      canvas.translate(totalLength, 0);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
