import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualification_flutter/helper/theme.dart';
import 'package:qualification_flutter/pages/login_page.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    child: const Nike(),
    create: (context) => ThemeProvider(isDark: false),
  ));
}

class Nike extends StatefulWidget {
  const Nike({super.key});

  @override
  State<Nike> createState() => _NikeState();
}

class _NikeState extends State<Nike> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: "Nike",
          theme: themeProvider.getTheme,
          home: const LoginPage(),
        );
      },
    );
  }
}
