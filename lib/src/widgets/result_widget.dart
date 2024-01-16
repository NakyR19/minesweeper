import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget(
      {super.key,
      required this.won,
      required this.isChallenge,
      required this.time});
  final bool isChallenge;
  final bool won;
  final int time;

  @override
  Widget build(BuildContext context) {
    String message;
    int completedTime = 180 - time;
    if (won && isChallenge) {
      message =
          'You did it, you completed the challenge in $completedTime seconds!';
    } else if (won && !isChallenge) {
      message = 'You won, you managed to complete the game in $time seconds!';
    } else {
      message = 'You lost! Try again.';
    }

    return AlertDialog(
      title: Text(won ? 'Congratulations' : 'Oh no...'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.home);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
