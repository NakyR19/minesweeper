import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import '../widgets/theme_widget.dart';

class ChooseThemePage extends StatelessWidget {
  const ChooseThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(
      title: const Text("Choose the Theme"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).popAndPushNamed(AppRoutes.home);
        },
      ),
      centerTitle: true,
      elevation: 5,
    );
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final availableWidth = mediaQuery.size.width -
        mediaQuery.padding.right -
        mediaQuery.padding.top;

    final cardHeight = availableHeight * 0.35;
    final cardWidth = availableWidth * 0.75;

    // List<Function> onTapFunctions = [onTapImage0, onTapImage1];

    return Scaffold(
      appBar: appBar,
      body: ThemeWidget(
          cardWidth: cardWidth,
          cardHeight: cardHeight,
          availableHeight: availableHeight),
    );
  }
}
