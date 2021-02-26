import 'dart:convert';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://192.168.0.45:8888';
  // static const String BASE_URL = 'https://ecofinder-api.herokuapp.com';
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

  // LOGIN

  static Future<dynamic> signIn(data) async {
    final response = await http.post(
      "${URLS.BASE_URL}/signin",
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );

    return response;
  }

  //CADASTRO

  static Future<dynamic> signUp(data) async {
    final response = await http.post(
      "${URLS.BASE_URL}/signup",
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );

    return response;
  }

  //CARREGA AS INFORMAÇÕES QUE APARECERÃO NO DASHBOARD

  static Future<dynamic> loadPlaces() async {
    final response = await http.get("${URLS.BASE_URL}/place/rating");
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
