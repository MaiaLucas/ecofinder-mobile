import 'dart:convert';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'https://ecofinder-api.herokuapp.com';
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
}
