import 'package:catan/ui/hexagon_tile.dart';
import 'package:catan/ui/tile_type.dart';
import 'package:flutter/material.dart';

const size = 50;

class HexGrid extends StatelessWidget {
  const HexGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HexagonTile(tileType: TileType.wool),
            SizedBox(width: 10),
            HexagonTile(tileType: TileType.brick),
            SizedBox(width: 10),
            HexagonTile(tileType: TileType.brick),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HexagonTile(tileType: TileType.brick),
            HexagonTile(tileType: TileType.brick),
            HexagonTile(tileType: TileType.brick),
            HexagonTile(tileType: TileType.brick),
          ],
        ),
      ],
    );
  }
}
