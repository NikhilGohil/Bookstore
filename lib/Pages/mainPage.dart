import 'dart:developer';
import 'package:bookstore/Providers/bookCountProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:bookstore/Data Layer/bookstoreAPIcall.dart';
import 'package:bookstore/Pages/booksGridViewComp.dart';
import 'package:bookstore/Global/Common/appBarComp.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 1));
  List<String> bookTypes = [
    "Novel",
    "Self-love",
    "Science",
    "Romance",
    "Historic"
  ];
  int _selected = 0;
  Bookstoreapicall _bookstoreapicall = Bookstoreapicall();
  @override
  void initState() {
    super.initState();
    _bookstoreapicall.getAllBooks();
  }

  int bookCount = 0;
  bool errorOccured = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // Navigation bar color
      statusBarColor: Colors.white, // Status bar color
      statusBarIconBrightness: Brightness.dark, // Status bar icons color
      systemNavigationBarIconBrightness:
          Brightness.dark, // Navigation bar icons color
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcomp(),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [Icon(Icons.home), Text("Home")],
            ),
            Column(
              children: [Icon(Icons.heart_broken), Text("Saved")],
            ),
            Column(
              children: [Icon(Icons.settings_outlined), Text("Setting")],
            ),
            Column(
              children: [Icon(Icons.account_circle), Text("Profile")],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onHorizontalDragDown: (e) {
            errorOccured
                ? setState(() {
                    log("$errorOccured");
                  })
                : null;
          },
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Books",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Consumer<Bookcountprovider>(
                      builder: (context, model, child) {
                        return Text(
                        "(${model.count} items )",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                margin: const EdgeInsets.only(bottom: 20),
                height: 30,
                child: ListView.separated(
                  itemCount: bookTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: _selected == index
                            ? BoxDecoration(
                                color: const Color.fromARGB(139, 158, 158, 158),
                                borderRadius: BorderRadius.circular(20),
                              )
                            : null,
                        child: Center(
                          child: Text(
                            bookTypes[index],
                            style: TextStyle(
                                fontSize: 17,
                                color: _selected == index
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: _selected == index
                                    ? FontWeight.bold
                                    : null),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 30,
                  ),
                ),
              ),
              FutureBuilder(
                future: _bookstoreapicall.getAllBooks(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    errorOccured = false;
                    bookCount = snapshot.data?.length;

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