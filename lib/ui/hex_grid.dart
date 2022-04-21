import 'dart:math';

import 'package:catan/ui/hexagon_tile.dart';
import 'package:catan/ui/tile_type.dart';
import 'package:flutter/material.dart';

import 'interactable_hexagon_tile.dart';

const double tileWidth = 88;

class HexGrid extends StatelessWidget {
  const HexGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    List<TileType> tiles =
        List.generate(19, (index) => TileType.values.elementAt(random.nextInt(TileType.values.length)));

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: tileWidth,
          child: Row(
            children: [
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(0)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(1)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(2)),
            ],
          ),
        ),
        Positioned(
          top: tileWidth * widthToHeightRatio * 0.75,
          left: tileWidth / 2,
          child: Row(
            children: [
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(3)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(4)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(5)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(6)),
            ],
          ),
        ),
        Positioned(
          top: tileWidth * widthToHeightRatio * 0.75 * 2,
          left: 0,
          child: Row(
            children: [
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(7)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(8)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(9)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(10)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(11)),
            ],
          ),
        ),
        Positioned(
          top: tileWidth * widthToHeightRatio * 0.75 * 3,
          left: tileWidth / 2,
          child: Row(
            children: [
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(12)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(13)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(14)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(15)),
            ],
          ),
        ),
        Positioned(
          top: tileWidth * widthToHeightRatio * 0.75 * 4,
          left: tileWidth,
          child: Row(
            children: [
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(16)),
              InteractableHexagonTile(width: tileWidth, initialTileType: tiles.elementAt(17)),
              HexagonTile(width: tileWidth, tileType: tiles.elementAt(18)),
            ],
          ),
        ),
      ],
    );
  }
}
