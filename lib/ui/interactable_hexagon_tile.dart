import 'package:catan/ui/hexagon_tile.dart';
import 'package:catan/ui/tile_type.dart';
import 'package:flutter/material.dart';

class InteractableHexagonTile extends StatefulWidget {
  const InteractableHexagonTile({required this.width, required this.initialTileType, Key? key}) : super(key: key);

  final double width;
  final TileType initialTileType;

  @override
  State<InteractableHexagonTile> createState() => _InteractableHexagonTileState();
}

class _InteractableHexagonTileState extends State<InteractableHexagonTile> {
  late TileType currentTileType = widget.initialTileType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          for (final tileType in TileType.values)
            Center(
              child: HexagonTile(
                width: widget.width * 0.9,
                tileType: tileType,
              ),
            ),
          HexagonTile(
            width: widget.width,
            tileType: currentTileType,
          ),
        ],
      ),
    );
  }
}
