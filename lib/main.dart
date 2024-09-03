import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/Pages/cartPage.dart';
import 'package:bookstore/Pages/loginPage.dart';
import 'package:bookstore/Pages/mainPage.dart';
import 'package:bookstore/Pages/onboarding.dart';
import 'package:bookstore/Pages/registerPage.dart';
import 'package:bookstore/Pages/searchPage.dart';
import 'package:bookstore/Pages/wishlistPage.dart';
import 'package:bookstore/Pages/orderPlaced.dart';
import 'package:bookstore/Providers/bookCountProvider.dart';
import 'package:bookstore/Providers/cartStateProvider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Bookcountprovider(),),
        ChangeNotifierProvider(create: (context) => Cartstateprovider(),),
      ],
      child: MaterialApp(
        initialRoute: 'onboard',
        title: 'Book Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.grey, selectionHandleColor: Colors.grey),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        routes: {
          'mainpage':(context) => Mainpage(),
          'onboard':(context) => Onboarding(),
          'login':(context) => Loginpage(),
          'register':(context) => Registerpage(),
          'cartpage':(context) => Cartpage(),
          'wishlist':(context) => Wishlistpage(),
          'search': (context) => Searchpage(),
          'orderplaced':(context) => Orderplaced(),
        },
      ),
    );
  }
}