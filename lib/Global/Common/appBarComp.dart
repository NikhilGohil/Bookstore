import 'package:flutter/material.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';

class Appbarcomp extends StatefulWidget implements PreferredSizeWidget {
  const Appbarcomp({super.key});

  @override
  State<Appbarcomp> createState() => _AppbarcompState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarcompState extends State<Appbarcomp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            "assets/logo-dark.png",
            height: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            "Bookstore",
            style: TextStyle(
                color: brown, fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.search,
            size: 30,
            color: brown,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.favorite_outline,
            size: 30,
            color: brown,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 30,
            color: brown,
          ),
        )
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
    );
  }
}
