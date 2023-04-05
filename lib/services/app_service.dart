import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Utilities/string_constant.dart';
import '../../models/auth_model.dart';
import '../../models/menu_model.dart';
import '../utilities/local_storage.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';

enum AppEndpoint {
  login,
  register,
  menuList,
}

class AppService extends ChangeNotifier {
  //MARK: EndPoint
  String getEndpointUrl(AppEndpoint endpoint) {
    switch (endpoint) {
      case AppEndpoint.login:
        return '${Texts.baseUrl()}authaccount/login';
      case AppEndpoint.register:
        return '${Texts.baseUrl()}authaccount/registration';
      case AppEndpoint.menuList:
        return '${Texts.baseUrlGit()}65bd1be2834809351c55125ddd4ce56b/raw/a46f6816fc4dc4310dd88ec2325e68a13eaf4678/menu_food.json';
    }
  }

  //MARK: Login  ==============================================================
  void signIn(String email, String password,
      Function(AuthModel?, bool) completion) async {
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
      AuthModel user = AuthModel.fromJson(json.decode(response.body));
      if (user.code == 0) {
        await LocalStorage.saveAuthModel(user);
        completion(user, true);
      } else {
        completion(null, false);
      }
    } else {
      completion(null, false);
    }
  }

  //MARK: Register ============================================================
  void signUp(String name, String email, String password,
      Function(AuthModel?, bool) completion) async {
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
      AuthModel user =
          AuthModel.fromJson(json.decode(response.body)); // passing model
      completion(user, true);
    } else {
      completion(null, false);
    }
  }

  //MARK: List Items In Home =================================================
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
