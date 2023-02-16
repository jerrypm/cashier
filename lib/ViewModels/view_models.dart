import 'dart:convert';
import 'dart:ffi';
import 'package:cashier_mate/Models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

//MARK: Login View Model
class LoginViewModel {
  LoginResponse? _user;
  LoginResponse? get user => _user;

  Future<void> login(String email, String password) async {
    String baseUrl = 'http://0.0.0.0:3003/';
    Uri url = Uri.parse('${baseUrl}login/auth');

    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    // Handle successful login
    if (response.statusCode == 200) {
      //MARK: Ini Untuk Data yang telah jadi model
      _user = LoginResponse.fromJson(json.decode(response.body));
      // debugPrint(response.body);

      //MARK: Manual untuk mengambil String
      final dataJson = json.decode(response.body);
      final dataString = dataJson['data']['username'];

      debugPrint(dataString);
    } else {
      // Handle login error
      debugPrint('Failed Login');
    }
  }
}

//MARK: Register View Model
class RegisterViewModel {
  /*

    MARK: Cara ke 1

*/
  Future<bool> register(String email, String password) async {
    String baseUrl = 'http://0.0.0.0:3003/';
    Uri url = Uri.parse('${baseUrl}register/auth');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return true; // jika success akan di balikan true
    } else {
      return false; // jika success akan di balikan false
    }
  }

/*

   MARK: Cara ke 2 dengan completion

*/
  void onRegister(
      String email, String password, Function(bool) completion) async {
    String baseUrl = 'http://0.0.0.0:3003/';
    Uri url = Uri.parse('${baseUrl}register/auth');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      completion(true);
    } else {
      completion(false);
    }
  }

  Future<String> fetchDataFromAPI() async {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
