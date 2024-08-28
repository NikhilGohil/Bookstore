import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookstore/Global/Common/button.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor:brown,
      statusBarColor: brown,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: brown,
      body: Column(
        children: [
          SizedBox(height: 181,),
          Image.asset('assets/logo.png'),
          SizedBox(height: 40,),
          Column(
            children: [
              Text("Welcome", style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w600),),
              Text("Read without limits", style: TextStyle(fontSize: 20, color: Colors.white),),
            ],
          ),
          SizedBox(height: 40,),
          Column(
            children: [
              ButtonComp(title: "Create Account", buttonColorWhite: true, buttonAction: (){Navigator.popAndPushNamed(context, 'register');},),
              ButtonComp(title: "Log In as Guest", buttonAction: () {Navigator.popAndPushNamed(context, 'login');},),
            ],
          )
        ],
      ),
    );
  }
}