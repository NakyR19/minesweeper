import 'package:flutter/material.dart';

class ChooseThemePage extends StatefulWidget {
  const ChooseThemePage({super.key});

  @override
  State<ChooseThemePage> createState() => _ChooseThemePageState();
}

class _ChooseThemePageState extends State<ChooseThemePage> {
  final List<String> imageUrls = [
    'https://media.discordapp.net/attachments/1195082960605556826/1195083202558177300/dilma-rindo.webp?ex=65b2b2f7&is=65a03df7&hm=bdc1d4ee9467a76d1f9f5b3d4961db6b291be27dfc6eb3637d0bba2a83a7f0c6&=&format=webp&width=797&height=500',
    'https://media.discordapp.net/attachments/1195082960605556826/1195083470041514125/lula.jpg?ex=65b2b336&is=65a03e36&hm=f693971d301cbc78c3a9c151ee042062d5eab58521215b94ca89592d869439d8&=&format=webp&width=595&height=396',
    'https://media.discordapp.net/attachments/1195082960605556826/1195083734270095360/ciro-globo-600x338-870x540.jpg?ex=65b2b375&is=65a03e75&hm=ba7c484612265af2e8ca8f33ae64c82b84e4ea4bbf96c71dfd2bab6a958bc8b4&=&format=webp&width=936&height=581',
    'https://media.discordapp.net/attachments/1195082960605556826/1195083950410961018/bolso.webp?ex=65b2b3a9&is=65a03ea9&hm=9a641d4cca4afefe5f64a3da7fdeffe8c2c4b3fddaa01a58d705fa084224cf58&=&format=webp&width=967&height=543',
  ];
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(
      title: const Text("Choose the Theme"),
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

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (var i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(2.8215),
              child: GestureDetector(
                  onTap: () {
                    print('Imagem $i clicada');
                  },
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
