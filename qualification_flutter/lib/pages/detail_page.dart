import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualification_flutter/helper/theme.dart';
import 'package:qualification_flutter/model/comment.dart';
import 'package:qualification_flutter/model/item.dart';
import 'package:qualification_flutter/pages/login_page.dart';
import 'package:qualification_flutter/pages/shop_page.dart';

class DetailPage extends StatefulWidget {
  final Item item;
  final String username;

  const DetailPage({super.key, required this.item, required this.username});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    void handleAddComment() {
      String comment = commentController.text;

      if (comment.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Comment cannot be empty"),
          ),
        );
      } else {
        setState(() {
          widget.item.comments.add(Comment(
              username: widget.username, comment: commentController.text));
        });
      }
    }

    return DefaultTabController(
      length: 2,
      child: Consumer<ThemeProvider>(
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
              shadowColor: Colors.black,
              bottom: TabBar(
                labelColor: themeProvider.iconColor(),
                tabs: const [
                  Tab(
                    text: "Detail",
                  ),
                  Tab(
                    text: "Comment",
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    widget.item.img,
                                    width: 180,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.item.name,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  convertToIdr(
                                    widget.item.price,
                                    2,
                                  ).toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  widget.item.desc,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: commentController,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  cursorColor: Colors.black,
                                  showCursor: true,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintText: "Please input your comment...",
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                    labelText: "Comment",
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    suffixIcon: Align(
                                      widthFactor: 1.0,
                                      heightFactor: 1.0,
                                      child: IconButton(
                                        onPressed: () {
                                          handleAddComment();
                                        },
                                        icon: const Icon(
                                          Icons.comment,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          constraints: const BoxConstraints.expand(),
                          child: Column(
                            children: [
                              const Text("Comments"),
                              const SizedBox(height: 10.0),
                              Container(
                                child: Expanded(
                                  child: ListView.builder(
                                    itemCount: widget.item.comments.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(widget
                                                .item.comments[index].comment),
                                            Text(
                                                "Commented by: ${widget.item.comments[index].username}")
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
