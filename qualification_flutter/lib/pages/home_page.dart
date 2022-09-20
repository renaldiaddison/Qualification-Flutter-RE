import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualification_flutter/helper/theme.dart';
import 'package:qualification_flutter/pages/login_page.dart';

class HomePage extends StatefulWidget {
  String username;

  HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

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
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "About Us",
                        style: TextStyle(
                          fontSize: 20,
                          color: themeProvider.iconColor(),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
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
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
