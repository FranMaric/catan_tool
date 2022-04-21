import 'package:catan/ui/tile_type.dart';
import 'package:flutter/material.dart';

const List<List<double>> points = [
  [1, 0.25],
  [0.5, 0],
  [0, 0.25],
  [0, 0.75],
  [0.5, 1],
  [1, 0.75],
];

/// tan(pi / 6) * 2
const widthToHeightRatio = 1.1547;

class HexagonTile extends StatelessWidget {
  HexagonTile({required this.tileType, this.width = 50, Key? key}) : super(key: key) {
    height = widthToHeightRatio * width;
  }

  final TileType tileType;

  final double width;
  late final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _HexagonPainter(
          color: colorFromType(tileType),
        ),
        child: Image.asset('assets/' + tileType.name + '.png'),
      ),
    );
  }

  Color colorFromType(TileType tileType) {
    switch (tileType) {
      case TileType.brick:
        return const Color.fromARGB(255, 156, 122, 113);
      case TileType.wool:
        return const Color.fromARGB(255, 168, 179, 111);
      case TileType.wheat:
        return const Color.fromARGB(255, 238, 199, 127);
      case TileType.wood:
        return const Color.fromARGB(255, 114, 152, 120);
      case TileType.stone:
        return const Color.fromARGB(255, 142, 143, 139);
    }
  }
}

class _HexagonPainter extends CustomPainter {
  _HexagonPainter({required Color color}) {
    _paint.color = color;
  }

  final Paint _paint = Paint()..strokeCap = StrokeCap.round;

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

    print(points);

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
