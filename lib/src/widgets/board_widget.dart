import 'package:flutter/material.dart';
import 'package:mineweeper/src/models/field.dart';
import 'package:mineweeper/src/widgets/field_widget.dart';
import '../models/board.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onSwitchMark;

  const BoardWidget(
      {super.key,
      required this.board,
      required this.onOpen,
      required this.onSwitchMark});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: board.columns,
      // Analisar Generic
      children: board.fields.map<Widget>((f) {
        return FieldWidget(
          field: f,
          onOpen: onOpen,
          onSwitchMark: onSwitchMark,
        );
      }).toList(),
    );
  }
}
