import 'package:flutter/material.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';

class ButtonComp extends StatelessWidget {
  String title;
  bool buttonColorWhite;
  Function buttonAction;
  ButtonComp({super.key, required this.title, this.buttonColorWhite = false, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: GestureDetector(
        onTap: () => buttonAction(),
        child: Container(
          width: double.maxFinite,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10), color: buttonColorWhite ? Colors.white : brown
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: buttonColorWhite ? brown : Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),);
  }
}