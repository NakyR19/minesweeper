import 'package:flutter/material.dart';
import 'package:mineweeper/src/models/board.dart';
import 'package:mineweeper/src/models/field.dart';
import 'package:mineweeper/src/widgets/board_widget.dart';
import 'package:mineweeper/src/widgets/result_widget.dart';

import '../models/exception.dart';

class MineWeeper extends StatefulWidget {
  const MineWeeper({super.key});

  @override
  State<MineWeeper> createState() => _MineWeeperState();
}

class _MineWeeperState extends State<MineWeeper> {
  bool? _won;
  Board? _board;

  _open(Field f) {
    if (_won != null) {
      return;
    }

    setState(() {
      try {
        f.open();
        if (_board!.solved) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board!.revealMines();
      }
    });
  }

  void _switchMark(Field f) {
    if (_won != null) {
      return;
    }

    setState(() {
      f.changeFlag();
      if (_board!.solved) {
        _won = true;
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int qtfyColumns = 12;
      double sizeField = width / qtfyColumns;
      int qtfyRows = (height / sizeField).floor();

      _board = Board(
        rows: qtfyRows,
        columns: qtfyColumns,
        qtfyMines: 2,
      );
    }
    return _board!; // ! = not null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MineWeeper'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Stack(children: [
        LayoutBuilder(builder: (ctx, constraints) {
          return BoardWidget(
            board: _getBoard(constraints.maxWidth, constraints.maxHeight),
            onOpen: _open,
            onSwitchMark: _switchMark,
          );
        }),
        if (_won != null) ...[
          ResultWidget(
            won: _won!,
          ),
        ],
      ]),
    );
  }
}
