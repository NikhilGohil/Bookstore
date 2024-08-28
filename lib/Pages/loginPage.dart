import 'package:bookstore/Data%20Layer/signInSignUp.dart';
import 'package:bookstore/Global/Common/button.dart';
import 'package:bookstore/Global/Common/inputTextFieldComp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    Signinsignup _signinsignup = Signinsignup();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/logo-dark.png'),
          Column(
            children: [
              Inputtextfieldcomp(controller: _emailController, hintText: "Email"),
              Inputtextfieldcomp(controller: _passwordController, hintText: "Password", password: true),
            ],
          ),
          Column(
            children: [
              ButtonComp(title: 'Login', buttonAction: () {
                _signinsignup.signIn(_emailController.text, _passwordController.text);
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Text(
                      "Sign up here",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}