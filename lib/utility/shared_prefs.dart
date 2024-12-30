import 'package:shared_preferences/shared_preferences.dart';

Future<void> setLogin(String isFrom) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('isFrom', isFrom);
}

Future<String?> getLogin() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('isFrom');
  } catch (e) {
    return null;
  }
}

Future<void> removeLogin() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('isFrom');
}
