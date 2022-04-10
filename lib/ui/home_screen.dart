import 'package:catan/ui/hexagon_tile.dart';
import 'package:catan/ui/tile_type.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HexagonTile(tileType: TileType.stone),
      ),
    );
  }
}
