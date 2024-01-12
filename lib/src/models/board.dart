import 'dart:math';
import 'field.dart';

class Board {
  final int rows;
  final int columns;
  final int qtfyMines;

  final List<Field> _fields = [];

  Board({
    required this.rows,
    required this.columns,
    required this.qtfyMines,
  }) {
    _createFields();
    _linkAdjacents();
    _raffleMines();
  }

  void restart() {
    for (var f in _fields) {
      f.restart();
    }
    _raffleMines();
  }

  void revealMines() {
    for (var f in _fields) {
      f.revealMine();
    }
  }

  void _createFields() {
    for (int l = 0; l < rows; l++) {
      for (int f = 0; f < columns; f++) {
        _fields.add(Field(row: l, column: f));
      }
    }
  }

  void _linkAdjacents() {
    for (var field in _fields) {
      for (var adjacent in _fields) {
        field.addAdjacent(adjacent);
      }
    }
  }

  void _raffleMines() {
    int raffled = 0;

    if (qtfyMines > rows * columns) {
      return;
    }

    while (raffled < qtfyMines) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].hasMine) {
        raffled++;
        _fields[i].mined();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get solved {
    return _fields.every((f) => f.solved);
  }
}
