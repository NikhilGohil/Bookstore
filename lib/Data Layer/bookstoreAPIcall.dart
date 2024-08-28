import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookstore/Global/Models/bookModel.dart';

class Bookstoreapicall {
  final String _baseURL = 'https://bookstore.incubation.bridgelabz.com';

  Future getAllBooks() async {
    String url = "$_baseURL/bookstore_user/get/book";
    try {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final jsonbookdata = json.decode(response.body) as Map<String, dynamic>;
        return await convertJsonToBookmodel(jsonbookdata['result']);
      }
    } catch (e) {
      print(e);
    }
  }

  List<Bookmodel> convertJsonToBookmodel(List data) {
    List<Bookmodel> bookData = [];
    for(var element in data) {
      Bookmodel book = Bookmodel(
        description: element['description'], 
        id: element['_id'], 
        admin_user_id: element['admin_user_id'], 
        author: element['author'], 
        bookName: element['bookName'], 
        discountPrice: element['discountPrice'], 
        price: element['price'], 
        quantity: element['quantity']);
      bookData.add(book);
    }
    return bookData;
  }
}