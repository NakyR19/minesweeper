import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/theme.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void abrirUrl() async {
    const url = 'https://github.com/NakyR19';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

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
                      child: Image.asset('assets/images/minesweeper.png')),
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
                    child: Image.asset('assets/images/anchorsweeperlogo.png'),
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
          Text('Credits:\n'
              'Fork of: Cod3r Cursos\n'
              'Developed by: Rafael Santos\n'),
          InkWell(
            onTap: abrirUrl,
            child: Text('Meu Github'),
          )
        ],
      ),
    );
  }
}
