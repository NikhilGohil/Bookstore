import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Signinsignup {
  final baseURL = "https://bookstore.incubation.bridgelabz.com";

  Future signIn(String email, String password) async {
    final url = "$baseURL/bookstore_user/login";
    log("email: $email, password: $password");
    final response = await http.post(Uri.parse(url), body: {
      "email": email,
      "password": password,
    });
    if(response.statusCode == 200) {
      //Parse the JSON
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      print("Response data: ${data['message']}");
      print("Response data: ${data['result']['accessToken']}");
    } else {
      //Handling the error
      print("Failed to load data. Status code: ${response.statusCode}");
    }
  }

  Future signUp(String fullName, String email, String password, String phone) async {
    final url = "$baseURL/bookstore_user/registration";
    log("email: $email, password: $password");
    final response = await http.post(Uri.parse(url), body: {
      "email": email,
      "password": password,
      "fullName": fullName,
      "phone": phone
    });
    if(response.statusCode == 200) {
      //Parse the JSON
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      print("Response data: $data");
    } else {
      //Handling the error
      print("Failed to load data. Status code: ${response.statusCode} ..... ${response.body}");
    }
  }
}