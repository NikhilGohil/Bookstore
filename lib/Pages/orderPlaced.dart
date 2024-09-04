import 'package:flutter/material.dart';
import 'package:bookstore/global/common/AppbarComp.dart';
import 'package:bookstore/Global/Common/button.dart';

class Orderplaced extends StatelessWidget {
  const Orderplaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Appbarcomp(),
      body: Container(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/pngwing.com.png',
                      height: 300,
                      width: 300,
                    ),
                  ),
                  Positioned(
                      child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: const Center(
                              child: Text(
                            'Order Placed Succesfully',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23),
                          ))))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'hurry!!! your order is confirmed, the order id is #123456 save the order id for further communication..',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                ),
              ),
              ButtonComp(
                  title: "Continue Shopping",
                  buttonAction: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      'mainpage',
                      (route) => false,
                    );
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}
