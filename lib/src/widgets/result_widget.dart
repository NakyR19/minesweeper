import 'package:flutter/material.dart';
import 'package:mineweeper/src/utils/app_routes.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key, required this.won});

  final bool won;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(won ? 'Parabéns' : 'Que pena'),
      content: Text(won ? 'Você Venceu!' : 'Você Perdeu!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.home);
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
