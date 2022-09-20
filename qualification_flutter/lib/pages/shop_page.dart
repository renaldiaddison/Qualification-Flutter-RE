import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qualification_flutter/helper/theme.dart';
import 'package:qualification_flutter/model/item.dart';
import 'package:qualification_flutter/pages/detail_page.dart';

class ShopPage extends StatefulWidget {
  String username;

  ShopPage({super.key, required this.username});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

String convertToIdr(dynamic number, int decimalDigit) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: decimalDigit,
  );
  return currencyFormatter.format(number);
}

class _ShopPageState extends State<ShopPage> {
  var items = [
    Item(
      name: "Nike Air Force 1",
      price: 2000000,
      desc: "This is the best nike air force 1 ever",
      img: "assets/nike-air-force-1.jpg",
    ),
    Item(
      name: "Nike Court Legacy",
      price: 2500000,
      img: "assets/nike-court-legacy.jpg",
      desc: "This is the best nike court legacy ever",
    ),
    Item(
      name: "Nike Court",
      price: 1000000,
      img: "assets/nike-court.jpg",
      desc: "This is the best nike court ever",
    ),
    Item(
      name: "Nike Crop Top",
      price: 500000,
      img: "assets/nike-croptop.jpg",
      desc: "This is the best crop top ever",
    ),
    Item(
      name: "Nike Pants",
      price: 500000,
      img: "assets/nike-pants.jpg",
      desc: "This is the best nike pants ever",
    ),
    Item(
      name: "Nike Zoom Air Fire",
      price: 1500000,
      img: "assets/nike-zoom-air-fire.jpg",
      desc: "This is the best nike zoom air fire ever",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.backgroundColor(),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailPage(
                                  item: items[index],
                                  username: widget.username,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeProvider.iconColor(),
                            border: Border.all(width: 0.5),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  items[index].img,
                                  width: 180,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                items[index].name,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: themeProvider.backgroundColor(),
                                ),
                              ),
                              Text(
                                convertToIdr(
                                  items[index].price,
                                  2,
                                ).toString(),
                                style: TextStyle(
                                  color: themeProvider.backgroundColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
