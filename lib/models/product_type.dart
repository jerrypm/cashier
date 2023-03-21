import 'package:shared_preferences/shared_preferences.dart'; // save data
import '../../Utilities/string_constant.dart'; // string constant file

enum ViewType {
  grid,
  list,
}

// Function for check login
Future<bool> checkLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(Texts.isLoginKey()) ?? false;
}
