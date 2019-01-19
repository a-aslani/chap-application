import 'package:mobile/service/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveApiToken(String apiToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user.api_token', apiToken);
}

removeApiToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('user.api_token');
  ApiService().removeUserToken();
}

logout() {
  removeApiToken();
  removeFullName();
}

Future<String> apiToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String apiToken = prefs.getString('user.api_token');
  return apiToken;
}

setFullName(String name, String family) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("user.name", name);
  prefs.setString("user.family", family);
}

Future<String> getFullName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return "${prefs.getString("user.name")} ${prefs.get("user.family")}";
}

removeFullName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('user.name');
  prefs.remove('user.family');
}