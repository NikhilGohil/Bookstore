import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:bookstore/Data Layer/bookstoreAPIcall.dart';
import 'package:bookstore/Pages/booksGridViewComp.dart';
import 'package:bookstore/Global/Common/appBarComp.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';
import 'package:bookstore/Global/Models/bookModel.dart';

class Bookssearchviewcomp extends StatefulWidget {
  String result;
  Bookssearchviewcomp({super.key, required this.result});

  @override
  State<Bookssearchviewcomp> createState() => _BookssearchviewcompState();
}

class _BookssearchviewcompState extends State<Bookssearchviewcomp> {
  bool errorOccured = false;
  Bookstoreapicall _bookstoreapicall = Bookstoreapicall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Appbarcomp(),
        body: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'mainpage', (route) => false);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Text(
                  "Showing result for",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.result,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            FutureBuilder(
                future: _bookstoreapicall.getAllBooks(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    errorOccured = false;
                    List<Bookmodel> data = snapshot.data
                        .where((Bookmodel item) => item.bookName
                            .toLowerCase()
                            .contains(widget.result.toLowerCase()))
                        .toList();
                    if (data.length == 0) {
                      return Center(
                        child: Text(
                          "No Data Found",
                          style: TextStyle(
                            color: brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return Booksgridviewcomp(
                      booksData: data,
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    errorOccured = false;
                    return Skeletonizer(
                        enabled: true,
                        enableSwitchAnimation: true,
                        child: Booksgridviewcomp(booksData: []));
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
                        "Something went wrong",
                        style: TextStyle(
                          color: brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
