import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resto_keys/classes/EncrypterHandler.dart';

abstract class ApiPaths {
  static String CreateUser = "/create-user";
  static String Login = "/login";
}

class ApiClient {
  final String apiUrl = "resto-keys-api.burydev.tech";
  ApiClient._();
  static final ApiClient _Client = ApiClient._();

  factory ApiClient() {
    return _Client;
  }

  Future createUser(String userName, String email, String password) {
    final url = Uri.http(apiUrl, ApiPaths.CreateUser);
    final requestBody = {
      "email": email,
      "userName": userName,
      "password": password,
    };
    final encodeBody = json.encode(requestBody);
    return http.post(url, body: encodeBody);
  }

  Future login(String email, String password) {
    final encryptedPassword = EncrypterHandler.encryptPassword(password);
    final url = Uri.http(apiUrl, ApiPaths.Login);
    final requestBody = {"password": encryptedPassword, "email": email};
    return http.post(url, body: json.encode(requestBody));
  }
}
