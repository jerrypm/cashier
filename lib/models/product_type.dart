import 'package:shared_preferences/shared_preferences.dart'; // save data
import '../../Utilities/string_constant.dart'; // string constant file

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
  return prefs.getBool(Texts.isLoginKey()) ?? false;
}
