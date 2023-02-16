import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cashier_mate/Utilities/string_constant.dart';
import 'package:cashier_mate/Models/user_model.dart';
import 'package:http/http.dart' as http;
// import 'package:connectivity_plus/connectivity_plus.dart';

enum AuthEndpoint {
  login,
  register,
  profile,
  logout,
}

class AuthService extends ChangeNotifier {
  //MARK: EndPoint
  String getEndpointUrl(AuthEndpoint endpoint) {
    switch (endpoint) {
      case AuthEndpoint.login:
        return '${Texts.baseUrl()}auth/login';
      case AuthEndpoint.register:
        return '${Texts.baseUrl()}auth/register';
      case AuthEndpoint.profile:
        return '${Texts.baseUrl()}users/profile';
      case AuthEndpoint.logout:
        return '${Texts.baseUrl()}auth/logout';
    }
  }

  //MARK: Login
  void signIn(String email, String password,
      Function(UserResponse?, bool) completion) async {
    final authService = AuthService();
    const endpoint = AuthEndpoint.login;
    final urlString = authService.getEndpointUrl(endpoint);
    Uri url = Uri.parse(urlString);

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      UserResponse user = UserResponse.fromJson(json.decode(response.body));
      completion(user, true);
    } else {
      completion(null, false);
    }
  }

  //MARK: Register
  void signUp(String name, String email, String password,
      Function(UserResponse?, bool) completion) async {
    final authService = AuthService();
    const endpoint = AuthEndpoint.register;
    final urlString = authService.getEndpointUrl(endpoint);
    Uri url = Uri.parse(urlString);

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      UserResponse user = UserResponse.fromJson(json.decode(response.body));
      completion(user, true);
    } else {
      completion(null, false);
    }
  }
}
