import 'exception.dart';

class Field {
  final int row;
  final int column;
  final List<Field> adjacents = [];

  bool _opened = false;
  bool _hasFlag = false;
  bool _hasMine = false;
  bool _exploded = false;

  Field({
    required this.row,
    required this.column,
  });

  void addAdjacent(Field adjacent) {
    final deltaRow = (row - adjacent.row).abs();
    final deltaColumn = (column - adjacent.column).abs();

    if (deltaRow == 0 && deltaColumn == 0) {
      return;
    }

    if (deltaRow <= 1 && deltaColumn <= 1) {
      adjacents.add(adjacent);
    }
  }

  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_hasMine) {
      _exploded = true;
      throw ExplosionException();
    }

    if (adjacentsSecure) {
      for (var a in adjacents) {
        a.open();
      }
    }
  }

  void revealMine() {
    if (_hasMine) {
      _opened = true;
    }
  }

  void mined() {
    _hasMine = true;
  }

  void changeFlag() {
    _hasFlag = !_hasFlag;
  }

  void restart() {
    _opened = false;
    _hasFlag = false;
    _hasMine = false;
    _exploded = false;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get hasFlag {
    return _hasFlag;
  }

  bool get hasMine {
    return _hasMine;
  }

  bool get solved {
    bool minedAndFlagged = hasMine && hasFlag;
    bool safeAndOpened = !hasMine && opened;
    return minedAndFlagged || safeAndOpened;
  }

  int get minesOnAdjacents {
    return adjacents.where((a) => a.hasMine).length;
  }

  bool get adjacentsSecure {
    return adjacents.every((a) => !a._hasMine);
  }
}
