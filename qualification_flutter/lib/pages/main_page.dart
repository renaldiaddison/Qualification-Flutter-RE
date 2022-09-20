import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualification_flutter/helper/theme.dart';
import 'package:qualification_flutter/pages/home_page.dart';
import 'package:qualification_flutter/pages/login_page.dart';
import 'package:qualification_flutter/pages/shop_page.dart';

class MainPage extends StatefulWidget {
  String username;

  MainPage({super.key, this.username = ""});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pages = [
      HomePage(username: widget.username),
      ShopPage(username: widget.username),
    ];

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: themeProvider.handleImage(),
            actions: [
              IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .swapTheme();
                },
                icon: const Icon(Icons.brightness_6),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ));

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ), (route) => false);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
            elevation: 2.0,
            shadowColor: themeProvider.iconColor(),
            bottomOpacity: 2.0,
          ),
          body: pages[_currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: themeProvider.iconColor(),
                  blurRadius: 3,
                ),
              ],
            ),
            child: NavigationBar(
              elevation: 2.0,
              height: 60.0,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              backgroundColor: themeProvider.backgroundColor(),
              selectedIndex: _currentIndex,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              destinations: [
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home,
                    color: themeProvider.iconColor(),
                  ),
                  icon: Icon(
                    Icons.home_outlined,
                    color: themeProvider.iconColor(),
                  ),
                  label: '',
                  tooltip: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.shop_2,
                    color: themeProvider.iconColor(),
                  ),
                  icon: Icon(
                    Icons.shop_2_outlined,
                    color: themeProvider.iconColor(),
                  ),
                  label: '',
                  tooltip: 'Shop',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
