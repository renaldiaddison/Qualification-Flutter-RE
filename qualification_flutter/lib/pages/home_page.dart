import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualification_flutter/helper/theme.dart';

class HomePage extends StatefulWidget {
  String username;

  HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Image handleImage(bool isDark) {
    if (isDark) {
      return Image.asset(
        'assets/logo/white.png',
        width: 50,
        height: 60,
        fit: BoxFit.fill,
      );
    }

    return Image.asset(
      'assets/logo/black.png',
      width: 60,
      height: 60,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: handleImage(themeProvider.isDark()),
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).swapTheme();
              },
              icon: const Icon(Icons.brightness_6),
            )
          ],
        ),
        body: Container(),
      );
    });
  }
}
