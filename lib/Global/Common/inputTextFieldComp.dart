import 'package:flutter/material.dart';

class Inputtextfieldcomp extends StatefulWidget {
  TextEditingController controller;
  bool password;
  String hintText;
  Inputtextfieldcomp(
      {super.key,
      required this.controller,
      this.password = false,
      required this.hintText});

  @override
  State<Inputtextfieldcomp> createState() => _InputtextfieldcompState();
}

class _InputtextfieldcompState extends State<Inputtextfieldcomp> {
  bool passwordView = false;

  @override
  void initState() {
    passwordView = widget.password;
    super.initState();
  }

  OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.grey, width: 1));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ]),
        child: TextField(
          controller: widget.controller,
          cursorColor: Colors.grey,
          obscureText: passwordView,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: borderStyle,
            focusedBorder: borderStyle,
            suffixIcon: widget.password 
            ? passwordView 
              ? IconButton(
                  icon: const Icon(Icons.visibility), 
                  onPressed: () {
                    setState(() {
                      passwordView = !passwordView;
                    });
                  },)
              : IconButton(icon: const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  passwordView = !passwordView;
                });
              })
            : null
          ),
        ),
      ),
    );
  }
}
