import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookstore/Global/Common/button.dart';
import 'package:bookstore/Global/Common/inputTextFieldComp.dart';
import 'package:bookstore/Data Layer/signInSignUp.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 84,
            ),
            Image.asset(
              'assets/logo-dark.png',
              width: 124,
              height: 115,
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Inputtextfieldcomp(
                  controller: _nameController,
                  hintText: "Full Name",
                  showShadow: true,
                ),
                Inputtextfieldcomp(
                  controller: _emailController,
                  hintText: "Email",
                  showShadow: true,
                ),
                Inputtextfieldcomp(
                  controller: _passwordController,
                  hintText: "Password",
                  showShadow: true,
                ),
                Inputtextfieldcomp(
                  controller: _phoneController,
                  hintText: "Phone",
                  showShadow: true,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ButtonComp(
                    title: 'Create Account',
                    buttonAction: () {
                      _signinsignup.signUp(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _phoneController.text);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, 'login');
                      },
                      child: Text(
                        'Login here',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}