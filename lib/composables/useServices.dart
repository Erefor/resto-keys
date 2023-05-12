import 'dart:convert';

import 'package:http/http.dart' as http;

Future useRegisUser(String email, String userName, String password) async {
  final data = Uri.http('resto-keys-api.burydev.tech', '/create-user');
  final request = await http.post(data,
      headers: {'Content-type': 'application/json'},
      body: jsonEncode({
        "password": "NA",
        "userName": "NA",
      }));
  print(request);
  return request;
}

abstract class ApiPaths {
  static String CreateUser = "/create-user";
  static String Login = "/login";
}

class ApiClient {
  final String apiUrl = "resto-keys-api.burydev.tech";
  ApiClient();
  Future POST(String path, Map body) {
    final url = Uri.http(apiUrl, path);
    return http.post(url,
        headers: {'Content-type': 'application/json'}, body: jsonEncode(body));
  }
}
