import 'package:bookstore/Global/Models/bookModel.dart';

class Cartbookmodel {
  Bookmodel product;
  int quantityToBuy;
  String id, uName, uEmail, phone;
  List? address;
  Cartbookmodel ({
    this.address,
    required this.uEmail,
    required this.uName,
    required this.id,
    required this.phone,
    required this.product,
    required this.quantityToBuy,
  });
}