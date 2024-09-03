import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/Data Layer/bookstoreAPIcall.dart';
import 'package:bookstore/Providers/cartStateProvider.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';
import 'package:bookstore/Global/Models/cartBookModel.dart';

class Bookscartlistview extends StatefulWidget {
  List? data;
  Bookscartlistview({super.key, this.data});

  @override
  State<Bookscartlistview> createState() => _BookscartlistviewState();
}

class _BookscartlistviewState extends State<Bookscartlistview> {
  Bookstoreapicall bookstoreapicall = Bookstoreapicall();
  @override
  Widget build(BuildContext context) {
    int? cartLen = widget.data?.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cartLen == null ? 3 : cartLen,
        itemBuilder: (context, index) {
          Cartbookmodel ? bookData = cartLen == 0 ? null : widget.data?[index];
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
                      "assets/bookCoverage.jpg",
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
                            bookData != null
                                ? bookData.product.bookName
                                : "Null",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis)),
                        Text(
                            bookData != null ? bookData.product.author : "Null",
                            style: TextStyle(color: Colors.grey, fontSize: 10)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Rs. ${bookData != null ? bookData.product.discountPrice : null}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                                "Rs. ${bookData != null ? bookData.product.price : null}",
                                style: TextStyle(
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (bookData != null) {
                                  bool stat = await bookstoreapicall.CartItemQuantity(
                                      bookData.id, bookData.quantityToBuy - 1);
                                  if (stat) {
                                    final _bookcount =
                                        Provider.of<Cartstateprovider>(context,
                                            listen: false);
                                    _bookcount.stateChange();
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: brown, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: brown,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                                "${bookData != null ? bookData.quantityToBuy : null}"),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (bookData != null) {
                                  bool stat = await bookstoreapicall.CartItemQuantity(
                                      bookData.id, bookData.quantityToBuy + 1);

                                  if (stat) {
                                    //  setState(() {
                                    //    bookdata.quantityToBuy = bookdata.quantityToBuy +1;
                                    //  });
                                    final _bookcount =
                                        Provider.of<Cartstateprovider>(context,
                                            listen: false);
                                    _bookcount.stateChange();
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: brown,
                                    border:
                                        Border.all(color: brown, width: 0.5),
                                    borderRadius: BorderRadius.circular(50)),
                                width: 25,
                                height: 25,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () async {
                    if(bookData != null) {
                      bool stat = await bookstoreapicall.RemoveFromCart(bookData.id);
                      if(stat) {
                        widget.data?.remove(widget.data?[index]);
                        setState(() {});
                      }
                    }
                  },
                  icon: Icon(Icons.close))
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
        ),
      ),
    );
  }
}