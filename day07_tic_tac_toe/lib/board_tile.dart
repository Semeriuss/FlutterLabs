import 'package:day07_tic_tac_toe/tile_state.dart';
import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  final double dimension;
  final VoidCallback onPressed;
  final TileState tileState;

  BoardTile(
      {Key? key,
      required this.dimension,
      required this.onPressed,
      required this.tileState})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      child: TextButton(onPressed: onPressed, child: widgetForTileState()),
    );
  }

  Widget widgetForTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.EMPTY:
        {
          widget = Container();
        }
        break;

      case TileState.CROSS:
        {
          widget = Image.asset('images/x.png');
        }
        break;

      case TileState.CIRCLE:
        {
          widget = Image.asset('images/o.png');
        }
        break;
    }

    return widget;
  }
}
