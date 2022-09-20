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
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool emailError = false;
  bool usernameError = false;
  bool passwordError = false;

  void handleLogin() {
    String username = usernameController.text;
    String password = passwordController.text;
    String email = emailController.text;

    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');

    if (!(email.endsWith(".com") && email.contains("@"))) {
      setState(() {
        emailError = true;
      });
    } else if (username.length < 5) {
      setState(() {
        usernameError = true;
      });
    } else if (!alphanumeric.hasMatch(password)) {
      setState(() {
        passwordError = true;
      });
    } else {
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
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        backgroundColor: themeProvider.backgroundColor(),
        appBar: AppBar(
          title: themeProvider.handleImage(),
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
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: themeProvider.iconColor()),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please input your credentials!",
                      style: TextStyle(
                        color: themeProvider.iconColor(),
                      ),
                    ),
                  ),
                ],
              ),
              Input(
                label: "email",
                isPassword: false,
                textVisible: true,
                textController: emailController,
                isError: emailError,
                themeProvider: themeProvider,
              ),
              Input(
                label: "username",
                isPassword: false,
                textVisible: true,
                textController: usernameController,
                isError: usernameError,
                themeProvider: themeProvider,
              ),
              Input(
                label: "password",
                isPassword: true,
                textVisible: false,
                textController: passwordController,
                themeProvider: themeProvider,
                isError: passwordError,
              ),
              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  side: const BorderSide(
                    color: Colors.grey,
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
