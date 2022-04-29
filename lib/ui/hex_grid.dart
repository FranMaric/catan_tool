import 'dart:math';

import 'package:flutter/material.dart';
import 'package:catan/ui/hexagon_tile.dart';
import 'interactive_hexagon_tile.dart';

class HexGrid extends StatelessWidget {
  const HexGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? currentlyOpenedMenu;

    List<InteractiveHexagonTileController> controllers = List.generate(
      30,
      (index) => InteractiveHexagonTileController(
        initialTileType: null,
        onTileChanged: (tileType) {},
        onMenuOpened: () {
          if (currentlyOpenedMenu == null) {
            currentlyOpenedMenu = index;
            return true;
          }
          return false;
        },
        onMenuClosed: () => currentlyOpenedMenu = null,
      ),
    );

    final tileWidth = MediaQuery.of(context).size.width > 700 ? 700 / 6 : (MediaQuery.of(context).size.width - 20) / 6;

    return InteractiveViewer(
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              left: tileWidth * 3 / 2,
              child: Row(
                children: [
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(0)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(1)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(2)),
                ],
              ),
            ),
            Positioned(
              left: tileWidth,
              top: tileWidth * widthToHeightRatio * 0.75,
              child: Row(
                children: [
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(3)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(4)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(5)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(6)),
                ],
              ),
            ),
            Positioned(
              left: tileWidth / 2,
              top: tileWidth * widthToHeightRatio * 0.75 * 2,
              child: Row(
                children: [
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(7)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(8)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(9)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(10)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(11)),
                ],
              ),
            ),
            Positioned(
              top: tileWidth * widthToHeightRatio * 0.75 * 3,
              child: Row(
                children: [
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(12)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(13)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(14)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(15)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(16)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(17)),
                ],
              ),
            ),
            Positioned(
              left: tileWidth / 2,
              top: tileWidth * widthToHeightRatio * 0.75 * 4,
              child: Row(
                children: [
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(18)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(19)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(20)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(21)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(22)),
                ],
              ),
            ),
            Positioned(
              left: tileWidth,
              top: tileWidth * widthToHeightRatio * 0.75 * 5,
              child: Row(
                children: [
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(23)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(24)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(25)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(26)),
                ],
              ),
            ),
            Positioned(
              left: tileWidth * 3 / 2,
              top: tileWidth * widthToHeightRatio * 0.75 * 6,
              child: Row(
                children: [
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(27)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(28)),
                  InteractiveHexagonTile(width: tileWidth, controller: controllers.elementAt(29)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
