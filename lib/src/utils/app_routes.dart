import 'package:flutter/material.dart';

import '../pages/mineweeper.dart';

class AppRoutes {
  static const home = '/';
  static const chooseThemePage = '/chooseThemePage';
  static const mineweeper = '/mineweeper';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mineweeper:
        bool isChallenge = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (_) => MineWeeper(isChallenge: isChallenge),
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
