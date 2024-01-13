import 'package:flutter/material.dart';
import 'package:mineweeper/src/utils/app_routes.dart';

import 'mineweeper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showPlayAndChooseTheme = true;
  bool _showNormalAndChallenge = false;
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(
      title: const Text("MineWeeper"),
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

    final buttonWidth = availableWidth * 0.4;
    final buttonHeight = availableHeight * 0.05;
    return Scaffold(
        appBar: appBar,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: availableWidth * 0.8,
                height: availableHeight * 0.5,
                child: Image.asset('assets/gif/logo.gif'),
              ),
              if (_showPlayAndChooseTheme) ...[
                // Se _showButtons for true, mostra os botões
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showNormalAndChallenge =
                              true; // Altera o estado para mostrar os botões
                          _showPlayAndChooseTheme =
                              false; // Altera o estado para ocultar os botôes
                        });
                      },
                      child: const Text('Play'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, AppRoutes.chooseThemePage);
                      },
                      child: const Text('Choose the Theme'),
                    ),
                  ),
                ),
              ],
              if (_showNormalAndChallenge) ...[
                // Se _showButtons for true, mostra os botões
                const Text(
                  'Choose the Mode',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                          context,
                          AppRoutes.mineweeper,
                          arguments: false,
                        );
                      },
                      child: const Text('Normal'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                          context,
                          AppRoutes.mineweeper,
                          arguments: true,
                        );
                      },
                      child: const Text('Challenge'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showNormalAndChallenge =
                              false; // Altera o estado para ocultar os botôes
                          _showPlayAndChooseTheme =
                              true; // Altera o estado para mostrar os botões
                        });
                      },
                      child: const Text('Back'),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ));
  }
}
