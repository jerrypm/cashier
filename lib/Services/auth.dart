import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  void signUp(String email, String password) async {
    Uri url = Uri.parse("_string_url");

    var response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );
    debugPrint(json.decode(response.body));
  }
}
