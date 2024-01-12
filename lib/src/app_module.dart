import 'package:flutter/material.dart';
import 'package:mineweeper/src/pages/home_page.dart';
import 'package:mineweeper/src/pages/mineweeper.dart';
import 'package:mineweeper/src/pages/theme_page.dart';

import 'utils/app_routes.dart';

class MineweeperApp extends StatelessWidget {
  const MineweeperApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.chooseThemePage: (context) => const ChooseThemePage(),
        AppRoutes.mineweeper: (context) => const MineWeeper(),
      },
    );
  }
}
