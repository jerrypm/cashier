import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cashier_mate/Utilities/string_constant.dart';
import 'package:cashier_mate/models/user_model.dart';
import 'package:cashier_mate/models/menu_model.dart';
import 'package:http/http.dart' as http;
// import 'package:connectivity_plus/connectivity_plus.dart';

enum AppEndpoint {
  login,
  register,
  profile,
  logout,
  menuList,
}

class AppService extends ChangeNotifier {
  //MARK: EndPoint
  String getEndpointUrl(AppEndpoint endpoint) {
    switch (endpoint) {
      case AppEndpoint.login:
        return '${Texts.baseUrl()}auth/login';
      case AppEndpoint.register:
        return '${Texts.baseUrl()}auth/register';
      case AppEndpoint.profile:
        return '${Texts.baseUrl()}users/profile';
      case AppEndpoint.logout:
        return '${Texts.baseUrl()}auth/logout';
      case AppEndpoint.menuList:
        return 'https://gist.githubusercontent.com/jerrypm/65bd1be2834809351c55125ddd4ce56b/raw/ef95e919f44028c9c60002a1f00fa52775ee9fe7/menu_food.json';
    }
  }

  //MARK: Login
  void signIn(String email, String password,
      Function(UserResponse?, bool) completion) async {
    final authService = AppService();
    const endpoint = AppEndpoint.login;
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
    final authService = AppService();
    const endpoint = AppEndpoint.register;
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

  void menuList(Function(MenuModel?, bool) completion) async {
    final menuService = AppService();
    const endpoint = AppEndpoint.menuList;
    final urlString = menuService.getEndpointUrl(endpoint);
    Uri url = Uri.parse(urlString);

    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      MenuModel menu = MenuModel.fromJson(json.decode(response.body));
      completion(menu, true);
    } else {
      completion(null, false);
    }
  }
}
