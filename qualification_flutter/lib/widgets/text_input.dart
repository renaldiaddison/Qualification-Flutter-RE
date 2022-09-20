import 'package:flutter/material.dart';
import 'package:qualification_flutter/helper/theme.dart';

class Input extends StatefulWidget {
  String label;
  bool isPassword;
  bool textVisible;
  TextEditingController textController;
  bool isError;
  ThemeProvider themeProvider;

  Input(
      {super.key,
      required this.label,
      required this.isPassword,
      required this.textVisible,
      required this.textController,
      required this.isError,
      required this.themeProvider});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  Icon icon() {
    if (widget.textVisible) {
      return Icon(
        Icons.remove_red_eye,
        color: widget.themeProvider.iconColor(),
      );
    }
    return Icon(
      Icons.remove_red_eye_outlined,
      color: widget.themeProvider.iconColor(),
    );
  }

  Widget passwordValid() {
    if (widget.isPassword) {
      return IconButton(
        onPressed: () {
          setState(() {
            widget.textVisible = !widget.textVisible;
          });
        },
        icon: icon(),
      );
    }
    return const Icon(null);
  }

  String capitalize(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }

  String? handleErrorText() {
    if (widget.isError) {
      if (widget.label == "username") {
        return "Username must be more than 5 characters";
      } else if (widget.label == "password") {
        return "Password must be alphanumeric and cannot be empty";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      obscureText: !widget.textVisible,
      style: TextStyle(
        fontSize: 15,
        color: widget.themeProvider.iconColor(),
      ),
      cursorColor: widget.themeProvider.iconColor(),
      showCursor: true,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: "Please input your ${widget.label}...",
        hintStyle: TextStyle(
          color: widget.themeProvider.iconColor(),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: capitalize(widget.label),
        labelStyle: TextStyle(
          color: widget.themeProvider.iconColor(),
        ),
        suffixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: passwordValid(),
        ),
        errorText: handleErrorText(),
      ),
    );
  }
}
