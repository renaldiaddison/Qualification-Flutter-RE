import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualification_flutter/helper/theme.dart';
import 'package:qualification_flutter/pages/home_page.dart';
import 'package:qualification_flutter/widgets/text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool robot = false;

  bool usernameError = false;
  bool passwordError = false;
  bool robotError = false;

  void handleLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');

    if (username.length < 5) {
      setState(() {
        usernameError = true;
      });
    } else if (!alphanumeric.hasMatch(password)) {
      setState(() {
        passwordError = true;
      });
    } else if (!robot) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Please validate you're not a robot!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Okay"))
            ],
          );
        },
      );
    }

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return HomePage(username: usernameController.text);
      },
    ));

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return HomePage(username: usernameController.text);
      },
    ), (route) => false);
  }

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
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            children: [
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please input your credentials!",
                    ),
                  ),
                ],
              ),
              Input(
                label: "username",
                isPassword: false,
                textVisible: true,
                textController: usernameController,
                isError: usernameError,
              ),
              Input(
                label: "password",
                isPassword: true,
                textVisible: false,
                textController: passwordController,
                isError: passwordError,
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("I'm not a robot"),
                value: robot,
                onChanged: (value) => {
                  setState(() {
                    robot = value!;
                  })
                },
                checkColor: Colors.black,
              ),
              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: const Text("Login"),
              )
            ],
          ),
        ),
      );
    });
  }
}
