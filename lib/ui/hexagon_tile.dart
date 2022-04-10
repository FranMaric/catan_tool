import 'dart:ui';
import 'package:flutter/material.dart';

const List<List<double>> points = [
  [1.4, 1],
  [0.5, 1.5],
  [-0.4, 1],
  [-0.4, 0],
  [0.5, -0.5],
  [1.4, 0],
  [1.4, 1],
];

class HexagonTile extends StatelessWidget {
  const HexagonTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: HexagonPainter(),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    path.addPolygon(
        points
            .map((point) => Offset(
                  point[0] * size.width,
                  point[1] * size.height,
                ))
            .toList(),
        true);

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
