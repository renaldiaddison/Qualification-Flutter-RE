import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  String label;
  bool isPassword;
  bool textVisible;
  TextEditingController textController;
  bool isError;

  Input(
      {super.key,
      required this.label,
      required this.isPassword,
      required this.textVisible,
      required this.textController,
      required this.isError});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  Icon icon() {
    if (widget.textVisible) {
      return const Icon(
        Icons.remove_red_eye,
        color: Colors.black,
      );
    }
    return const Icon(
      Icons.remove_red_eye_outlined,
      color: Colors.black,
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
      if (widget.isPassword) {
        return "Password must be alphanumeric";
      }
      return "Username must be more than 5 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      obscureText: !widget.textVisible,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      showCursor: true,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: "Please input your ${widget.label}...",
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: capitalize(widget.label),
        labelStyle: const TextStyle(
          color: Colors.black,
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
