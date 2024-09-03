import 'package:flutter/material.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';
import 'package:bookstore/Data Layer/bookstoreAPIcall.dart';

class Appbarcomp extends StatefulWidget implements PreferredSizeWidget {
  const Appbarcomp({super.key});

  @override
  State<Appbarcomp> createState() => _AppbarcompState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarcompState extends State<Appbarcomp> {
  int cartCount = 0;
  void initState() {
    cartItem();
    super.initState();
  }

  void cartItem() async {
    Bookstoreapicall _bookstoreapicall = Bookstoreapicall();
    final data = await _bookstoreapicall.getCartBooks();
    cartCount = data.length;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
        IconButton(onPressed: () {
          Navigator.pushNamed(context, 'search');
        }, icon: const Icon(
          Icons.search, size: 30, color: brown,
        )),
        IconButton(onPressed: () {
          Navigator.pushNamed(context, 'wishlist');
        }, icon: Icon(
          Icons.favorite_outlined, size: 30, color: brown,
        )),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'cartpage');
          },
          icon: Stack(children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: brown,
            ),
            cartCount!= 0? Positioned(
                right: 3,
                top: 0.5,
                child: Container(
                  padding: EdgeInsets.zero,
                  height: 17,
                  width: 17,
                  child: Center(
                    child: Text(
                      "$cartCount",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: brown, borderRadius: BorderRadius.circular(10)),
                )):Container(),
          ]),
        )
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
    );
  }
}
