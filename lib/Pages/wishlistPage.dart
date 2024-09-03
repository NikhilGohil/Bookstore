import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:bookstore/Data Layer/bookstoreAPIcall.dart';
import 'package:bookstore/Pages/booksGridViewComp.dart';
import 'package:bookstore/Global/Common/appBarComp.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';

class Wishlistpage extends StatefulWidget {
  const Wishlistpage({super.key});

  @override
  State<Wishlistpage> createState() => _WishlistpageState();
}

class _WishlistpageState extends State<Wishlistpage> {
  var bookCount = 0;

  bool errorOccured = false;
  Bookstoreapicall _bookstoreapicall = Bookstoreapicall();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (bool didPop, dynamic value) {
        if (didPop) {
          return;
        }
        Navigator.pushNamedAndRemoveUntil(
          context,
          'mainpage',
          (route) => false,
        );
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: Appbarcomp(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'mainpage',
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    "Wishlist",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "($bookCount items )",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              FutureBuilder(
                future: _bookstoreapicall.getWishlistBooks(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    errorOccured = false;
                    bookCount = snapshot.data?.length;

                    print(snapshot.data.runtimeType);
                    return Booksgridviewcomp(
                      booksData: snapshot.data,
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    errorOccured = false;

                    return Skeletonizer(
                        enabled: true,
                        enableSwitchAnimation: true,
                        child: Booksgridviewcomp(
                          booksData: [],
                        ));
                  } else if (snapshot.data?.length == 0) {
                    return Center(
                      child: Text(
                        "No Data Found",
                        style: TextStyle(
                            color: brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  errorOccured = true;
                  return Container(
                      height: 400,
                      child: Center(
                          child: Text(
                        "Some thing went wrong",
                        style: TextStyle(
                            color: brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
