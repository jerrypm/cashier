import 'package:shared_preferences/shared_preferences.dart'; // save data
import 'package:cashier_mate/Utilities/string_constant.dart'; // string constant file

enum ViewType {
  grid,
  list,
}

class ItemArrayList {
  final String imageUrl;
  final String title;
  final String price;

  ItemArrayList(
      {required this.imageUrl, required this.title, required this.price});
}

// Function for check login
Future<bool> checkLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool(Texts.isLoginKey()) ?? false;
  return isLoggedIn;
}

// Function for grid view Read
Future<bool> getGridView() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isGridView = prefs.getBool(Texts.isGrid()) ?? false;
  return isGridView;
}

// Function for grid view Write
Future<bool> setGridView(bool isGrid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isGridView = await prefs.setBool(Texts.isGrid(), true);
  return isGridView;
}
