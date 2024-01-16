import 'package:flutter/material.dart';

import '../pages/minesweeper.dart';

class AppRoutes {
  static const home = '/';
  static const chooseThemePage = '/chooseThemePage';
  static const minesweeper = '/minesweeper';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case minesweeper:
        bool isChallenge = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => MineSweeper(isChallenge: isChallenge),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Parabéns tu encontrou um bug! Disgraça'),
            ),
          ),
        );
    }
  }
}
