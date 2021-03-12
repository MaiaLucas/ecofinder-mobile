import 'dart:convert';
import 'dart:async';
import 'package:ecofinder/models/Highlights.dart';
import 'package:ecofinder/models/Place.dart';
import 'package:ecofinder/services/urls.dart';
import 'package:http/http.dart' as http;

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

  //CARREGA AS INFORMAÇÕES DO DASHBOARD
  static Future<Highlights> loadDashboardInfo() async {
    final response = await http.get("${URLS.BASE_URL}/dashboard?page=7");
    if (response.statusCode == 200) {
      return Highlights.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  //CARREGA AS INFORMAÇÕES DO DASHBOARD
  static Future<Place> placeDetail(int id) async {
    final response =
        await http.get("${URLS.BASE_URL}/place/detail/${id.toString()}");
    if (response.statusCode == 200) {
      return Place.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
