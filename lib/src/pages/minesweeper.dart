import 'package:flutter/material.dart';
import '../models/board.dart';
import '../models/field.dart';
import '../widgets/board_widget.dart';
import '../widgets/result_widget.dart';
import 'dart:async';
import '../models/exception.dart';

class MineSweeper extends StatefulWidget {
  const MineSweeper({required this.isChallenge, super.key});

  final bool isChallenge;

  @override
  State<MineSweeper> createState() => _MineSweeperState();
}

class _MineSweeperState extends State<MineSweeper> {
  bool? _won;
  Board? _board;
  int _timerValue = 180;
  int _timerValueNormal = 0;
  Timer? _timer;

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
        qtfyMines: 30,
      );
    }
    return _board!; // ! = not null
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Welcome to MineSweeper!'),
            content: const Text('Press OK to start playing!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _startTimer();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_won == true) {
        timer.cancel();
      } else if (widget.isChallenge) {
        if (_timerValue == 0) {
          timer.cancel();
          setState(() {
            _won = false;
          });
        } else {
          setState(() {
            _timerValue--;
          });
        }
      } else {
        setState(() {
          _timerValueNormal++;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer),
            const SizedBox(width: 5),
            Text(widget.isChallenge
                ? 'Timer: $_timerValue'
                : 'Timer: $_timerValueNormal'),
          ],
        ),
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
            isChallenge: widget.isChallenge,
            time: widget.isChallenge ? _timerValue : _timerValueNormal,
          ),
        ],
      ]),
    );
  }
}
