import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:ecofinder/models/Highlights.dart';
import 'package:ecofinder/models/Place.dart';
import 'package:ecofinder/models/Product.dart';
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

  static dynamic recover(String email) async {
    final response = await http.post("${URLS.BASE_URL}/recover?email=$email");
    return jsonDecode(response.body);
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

  //CARREGA AS INFORMAÇÕES DO DASHBOARD
  static Future<dynamic> searchPlace({String city, String type}) async {
    String searchCity = "";
    String searchType = "";
    if (city.isNotEmpty) {
      searchCity = "city=$city&";
    }
    if (type.isNotEmpty) {
      searchType = "type=$type";
    }
    final response =
        await http.get("${URLS.BASE_URL}/search_place?$searchCity$searchType");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
      // return Place.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  //CARREGA AS INFORMAÇÕES DO DASHBOARD
  static Future<dynamic> searchProduct({String products}) async {
    final response =
        await http.get("${URLS.BASE_URL}/product/search?product=$products");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
      // return Place.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  //CARREGA AS INFORMAÇÕES DO DASHBOARD
  static Future<Product> productDetail(int id) async {
    final response =
        await http.get("${URLS.BASE_URL}/product/${id.toString()}");
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
