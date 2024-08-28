import 'package:flutter/material.dart';
import 'package:bookstore/Global/Common/appBarComp.dart';
import 'package:bookstore/Global/Common/button.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarcomp(),
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              const Text(
                "My Bag",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "(10 items)",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/bookCoverPage.jpg',
                              height: 110,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shreemantayogi",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Text("By Ranjit Desai",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Rs. 1500",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Text("Rs. 2000",
                                        style: TextStyle(
                                            fontSize: 10,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: brown, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 25,
                                      height: 25,
                                      child: Icon(
                                        Icons.remove,
                                        size: 20,
                                        color: brown,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("1"),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: brown,
                                          border: Border.all(
                                              color: brown, width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 25,
                                      height: 25,
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.close),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Customer Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(113, 0, 0, 0),
              spreadRadius: 0.5,
              blurRadius: 3)
        ]),
        child: BottomAppBar(
          height: 100,
          elevation: 20,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rs. 3000",
                    style: TextStyle(
                        color: brown,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  VerticalDivider(
                    width: 1,
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                      width: 160,
                      child: ButtonComp(
                          title: "Place Order", buttonAction: () {})),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
