import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/minesweeper.dart';
import 'pages/theme_page.dart';
import 'utils/app_routes.dart';
import 'utils/color_scheme.dart';

class MineSweeperApp extends StatelessWidget {
  const MineSweeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.chooseThemePage: (context) => const ChooseThemePage(),
        AppRoutes.minesweeper: (context) => MineSweeper(
              isChallenge: ModalRoute.of(context)!.settings.arguments as bool,
            ),
      },
    );
  }
}
