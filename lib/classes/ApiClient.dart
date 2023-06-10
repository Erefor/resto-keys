import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:resto_keys/classes/EncrypterHandler.dart';
import 'package:resto_keys/classes/UserAuthProvider.dart';

abstract class ApiPaths {
  static String CreateUser = "/create-user";
  static String Login = "/login";
  static String CreatePassword = "/create-password";
  static String UserPasswords = "/list-passwords";
  static String TestToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBlcmV6Zy5qb3Nlc2FsQGdtYWlsLmNvbSIsInVzZ"
      "XJuYW1lIjpudWxsLCJpZCI6IjEiLCJpYXQiOjE2ODYwNzc3NDJ9.cRVLTLjSAFDP7nh"
      "37zHAshpxl_C4Hd4L_z3qZW2KbqQ";
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

  Future createPassword(
    String newPassword,
    String category,
    String label,
    String? direction,
  ) {
    final auth = UserData();
    final encryptedPassword = EncrypterHandler.encryptPassword(newPassword);
    final url = Uri.http(apiUrl, ApiPaths.CreatePassword);
    final requestBody = {
      "newPassword": encryptedPassword,
      "category": direction ?? '',
      "label": label,
      "direction": direction ?? ''
    };
    final requestHeaders = {"auth": ApiPaths.TestToken};
    return http.post(url,
        body: json.encode(requestBody), headers: requestHeaders);
  }

  Future getUserPasswords() async {
    final queryParams = {"user-id": '1'};
    final url = Uri.http(apiUrl, ApiPaths.UserPasswords, queryParams);
    final requestHeaders = {"auth": ApiPaths.TestToken};
    final response = await http.get(url, headers: requestHeaders);
    final decodeResponse = jsonDecode(response.body);
    return decodeResponse;
  }
}
