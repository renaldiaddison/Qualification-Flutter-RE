import 'package:qualification_flutter/model/comment.dart';

class Item {
  String name;
  int price;
  String img;
  String desc;
  List<Comment> comments = [];

  Item({
    required this.name,
    required this.price,
    required this.img,
    required this.desc,
  });
}
