import 'package:flutter/material.dart';
import 'package:mineweeper/src/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/theme.dart';

class ChooseThemePage extends StatefulWidget {
  const ChooseThemePage({super.key});

  @override
  State<ChooseThemePage> createState() => _ChooseThemePageState();
}

class _ChooseThemePageState extends State<ChooseThemePage> {
  final List<String> imageUrls = [
    'https://media.discordapp.net/attachments/1195082960605556826/1195083202558177300/dilma-rindo.webp?ex=65b2b2f7&is=65a03df7&hm=bdc1d4ee9467a76d1f9f5b3d4961db6b291be27dfc6eb3637d0bba2a83a7f0c6&=&format=webp&width=797&height=500',
    'https://media.discordapp.net/attachments/1195082960605556826/1195083470041514125/lula.jpg?ex=65b2b336&is=65a03e36&hm=f693971d301cbc78c3a9c151ee042062d5eab58521215b94ca89592d869439d8&=&format=webp&width=595&height=396',
  ];
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

    final cardHeight = availableHeight * 0.242;

    void onTapImage0(BuildContext context) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final themeChanger = Provider.of<ThemeChanger>(context, listen: false);
        themeChanger.theme = false;
      });
    }

    void onTapImage1(BuildContext context) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final themeChanger = Provider.of<ThemeChanger>(context, listen: false);
        themeChanger.theme = true;
      });
    }

    List<Function> onTapFunctions = [onTapImage0, onTapImage1];

    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (var i = 0; i < 2; i++)
            Padding(
              padding: const EdgeInsets.all(2.8215),
              child: GestureDetector(
                  onTap: () => onTapFunctions[i](context),
                  child: Center(
                    child: Container(
                      width: availableWidth,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(imageUrls[i]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )),
            ),
        ],
      ),
    );
  }
}
