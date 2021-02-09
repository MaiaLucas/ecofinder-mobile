import 'dart:convert';
import 'package:ecofinder/models/login_model.dart';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://192.168.0.45:8888';
  //'https://ecofinder-api.herokuapp.com';
}

class ApiService {
  static Future<List<dynamic>> getUser() async {
    final response = await http.get("${URLS.BASE_URL}/user");
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<LoginResponseModel> signIn(
      String email, String password) async {
    final response = await http.post("${URLS.BASE_URL}/signin",
        headers: {"content-type": "application/json"},
        body: jsonEncode({"email": email, "password": password}));

    switch (response.statusCode) {
      case 200:
        print(json.decode(response.body));
        return LoginResponseModel.fromJson(
          json.decode(response.body),
        );
        break;
      case 400:
      case 401:
        print(json.decode(response.body));
        return LoginResponseModel.fromJson(
          json.decode(response.body),
        );
        break;
      default:
        print('error');
    }
  }
}
