import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/theme.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({
    super.key,
    required this.cardWidth,
    required this.cardHeight,
    required this.availableHeight,
  });

  final double cardWidth;
  final double cardHeight;
  final double availableHeight;
  static const snackBar = SnackBar(
    content: Text('Theme changed successfully!'),
    duration: Duration(seconds: 1),
  );

  @override
  Widget build(BuildContext context) {
    void onPressedMine() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final themeChanger = Provider.of<ThemeChanger>(context, listen: false);
        themeChanger.theme = false;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    void onPressedAnchor() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final themeChanger = Provider.of<ThemeChanger>(context, listen: false);
        themeChanger.theme = true;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return Center(
      child: Column(
        children: [
          SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 15,
                  bottom: 10,
                  child: SizedBox(
                      width: cardWidth,
                      height: cardHeight,
                      child: Image.asset('assets/images/logo2.png')),
                ),
                Positioned(
                  bottom: 0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 5),
                    onPressed: onPressedMine,
                    child: const Text('Choose'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 30,
                  child: SizedBox(
                    width: cardWidth,
                    height: cardHeight,
                    child: Image.asset('assets/images/anchorlogo.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 5),
                    onPressed: onPressedAnchor,
                    child: const Text('Choose'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: availableHeight * 0.05,
          ),
          const Text(
            'Credits:\n'
            'Fork of: Cod3r Cursos\n'
            'Developed by: Rafael Santos\n'
            'Github: NakyR19\n'
            'Icons made by Freepik from www.flaticon.com\n',
          ),
        ],
      ),
    );
  }
}
