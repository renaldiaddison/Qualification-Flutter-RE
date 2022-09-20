import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualification_flutter/helper/theme.dart';

class HomePage extends StatefulWidget {
  String username;

  HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  var images = [
    "assets/nike-air-force-1.jpg",
    "assets/nike-court.jpg",
    "assets/nike-court-legacy.jpg",
    "assets/nike-croptop.jpg",
    "assets/nike-pants.jpg",
    "assets/nike-zoom-air-fire.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.backgroundColor(),
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
            ],
            elevation: 4.0,
            shadowColor: themeProvider.iconColor(),
            bottomOpacity: 2.0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome, ${widget.username}!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: themeProvider.iconColor(),
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    height: 350,
                  ),
                  items: images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            // padding: const EdgeInsets.all(50),
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Image.asset(
                              i,
                              fit: BoxFit.cover,
                              width: 1000,
                            ));
                      },
                    );
                  }).toList(),
                ),
                Wrap(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "About Us",
                        style: TextStyle(
                          fontSize: 20,
                          color: themeProvider.iconColor(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nike, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services. The company is headquartered near Beaverton, Oregon, in the Portland metropolitan area. It is the world's largest supplier of athletic shoes and apparel and a major manufacturer of sports equipment, with revenue in excess of US\$37.4 billion in its fiscal year 2020 (ending May 31, 2020). As of 2020, it employed 76,700 people worldwide.",
                        style: TextStyle(
                          fontSize: 16,
                          color: themeProvider.iconColor(),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
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
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.logout,
                  color: themeProvider.iconColor(),
                ),
                icon: Icon(
                  Icons.logout_outlined,
                  color: themeProvider.iconColor(),
                ),
                label: '',
                tooltip: 'Log Out',
              ),
            ],
          ),
        );
      },
    );
  }
}
