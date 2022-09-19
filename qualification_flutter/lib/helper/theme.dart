import 'package:flutter/material.dart';

const Map<int, Color> colorBlack = {
  50: Color.fromRGBO(255, 0, 0, 0),
  100: Color.fromRGBO(255, 0, 0, 0),
  200: Color.fromRGBO(255, 0, 0, 0),
  300: Color.fromRGBO(255, 0, 0, 0),
  400: Color.fromRGBO(255, 0, 0, 0),
  500: Color.fromRGBO(255, 0, 0, 0),
  600: Color.fromRGBO(255, 0, 0, 0),
  700: Color.fromRGBO(255, 0, 0, 0),
  800: Color.fromRGBO(255, 0, 0, 0),
  900: Color.fromRGBO(255, 0, 0, 0),
};

const Map<int, Color> colorWhite = {
  50: Color.fromARGB(0, 255, 255, 255),
  100: Color.fromARGB(0, 255, 255, 255),
  200: Color.fromARGB(0, 255, 255, 255),
  300: Color.fromARGB(0, 255, 255, 255),
  400: Color.fromARGB(0, 255, 255, 255),
  500: Color.fromARGB(0, 255, 255, 255),
  600: Color.fromARGB(0, 255, 255, 255),
  700: Color.fromARGB(0, 255, 255, 255),
  800: Color.fromARGB(0, 255, 255, 255),
  900: Color.fromARGB(0, 255, 255, 255),
};

class ThemeProvider extends ChangeNotifier {
  ThemeData darkTheme = ThemeData(
    primarySwatch: const MaterialColor(0xFF000000, colorBlack),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  ThemeData lightTheme = ThemeData(
    primarySwatch: const MaterialColor(0xFFFFFFFF, colorWhite),
    iconTheme: const IconThemeData(color: Colors.white),
  );

  late ThemeData _selectedTheme;

  ThemeProvider({required bool isDark}) {
    _selectedTheme = isDark ? darkTheme : lightTheme;
  }

  void swapTheme() {
    _selectedTheme = _selectedTheme == darkTheme ? lightTheme : darkTheme;
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
  bool isDark() {
    return _selectedTheme == darkTheme ? true : false;
  }
}
