import 'package:flutter/material.dart';
import 'package:bookstore/Pages/cartPage.dart';
import 'package:bookstore/Pages/loginPage.dart';
import 'package:bookstore/Pages/mainPage.dart';
import 'package:bookstore/Pages/onboarding.dart';
import 'package:bookstore/Pages/registerPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'cartpage',
      title: 'Book Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        'mainpage':(context) => Mainpage(),
        'onBoard':(context) => Onboarding(),
        'login':(context) => Loginpage(),
        'register':(context) => Registerpage(),
        'cartpage':(context) => Cartpage(),
      },
    );
  }
}