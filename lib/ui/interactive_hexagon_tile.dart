import 'dart:math';

import 'package:catan/ui/hexagon_tile.dart';
import 'package:catan/ui/tile_type.dart';
import 'package:flutter/material.dart';

const _radius = 90;

/// I know this isn't a real controller but that was the best name I could come up at that time
class InteractiveHexagonTileController {
  InteractiveHexagonTileController({
    TileType? initialTileType,
    required this.onTileChanged,
    this.onMenuOpened,
    this.onMenuClosed,
  }) : currentTileType = initialTileType;

  TileType? currentTileType;
  final void Function(TileType) onTileChanged;
  final bool Function()? onMenuOpened;
  final VoidCallback? onMenuClosed;

  void onTileUpdated(TileType newTileType) {
    onTileChanged(newTileType);
    currentTileType = newTileType;
  }
}

class InteractiveHexagonTile extends StatefulWidget {
  const InteractiveHexagonTile({
    required this.width,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final double width;
  final InteractiveHexagonTileController controller;

  @override
  State<InteractiveHexagonTile> createState() => _InteractiveHexagonTileState();
}

class _InteractiveHexagonTileState extends State<InteractiveHexagonTile> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void onTileTapped(TileType newTileType) {
    widget.controller.onTileUpdated(newTileType);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (animationController.value > 0) {
          if (widget.controller.onMenuClosed != null) {
            widget.controller.onMenuClosed!();
          }
          animationController.reverse();
        } else if (animationController.value == 0) {
          final canOpen = widget.controller.onMenuOpened != null ? widget.controller.onMenuOpened!() : true;

          if (canOpen) {
            animationController.forward();
          }
        }
      },
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget? child) {
              return Stack(
                children: [
                  for (int i = 0; i < TileType.values.length; i++)
                    Transform.translate(
                      offset: Offset(
                        sin(2 * pi / TileType.values.length * i) * _radius * animationController.value,
                        cos(2 * pi / TileType.values.length * i) * _radius * animationController.value,
                      ),
                      child: InkWell(
                        onTap: () => onTileTapped(TileType.values.elementAt(i)),
                        child: HexagonTile(
                          width: widget.width,
                          tileType: TileType.values.elementAt(i),
                        ),
                      ),
                    ),
                  HexagonTile(
                    width: widget.width,
                    tileType: widget.controller.currentTileType,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
