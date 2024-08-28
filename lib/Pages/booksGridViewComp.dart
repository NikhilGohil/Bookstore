import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:bookstore/Global/Common/colorPalet.dart';
import 'package:bookstore/Global/Models/bookModel.dart';

class Booksgridviewcomp extends StatefulWidget {
  List<Bookmodel> booksData;
  Booksgridviewcomp({super.key, required this.booksData});

  @override
  State<Booksgridviewcomp> createState() => _BooksgridviewcompState();
}

class _BooksgridviewcompState extends State<Booksgridviewcomp> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.booksData.isEmpty ? 6 : widget.booksData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    aboutBook(widget.booksData.length != 0
                        ? widget.booksData[index]
                        : null);
                  },
                  child: Container(
                    child: Image.asset(
                      "assets/bookCoverPage.jpg",
                      height: 140,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.booksData.length != 0
                            ? widget.booksData[index].bookName
                            : "Null",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        widget.booksData.length != 0
                            ? widget.booksData[index].author
                            : "Null",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      Row(
                        children: [
                          Text(
                            "Rs. ${widget.booksData.length != 0 ? widget.booksData[index].discountPrice : null}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "Rs. ${widget.booksData.length != 0 ? widget.booksData[index].price : null}",
                            style: TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                borderRadius: BorderRadius.circular(5)),
                            width: 35,
                            height: 35,
                            child: Icon(
                              Icons.favorite_outline,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: brown,
                                border: Border.all(color: brown),
                                borderRadius: BorderRadius.circular(5)),
                            width: 95,
                            height: 35,
                            child: Center(
                              child: Text(
                                "ADD TO BAG",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Future aboutBook([Bookmodel? bookModel]) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 250,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "Assets/bookCoverPage.jpg",
                          height: 100,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookModel!.bookName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              bookModel!.author,
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      bookModel.description,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ));
  }
}
