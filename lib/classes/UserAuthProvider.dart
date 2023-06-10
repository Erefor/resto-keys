import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:resto_keys/models/UserAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthProvider with ChangeNotifier {
  UserAuth? _userAuth;

  set setUserAuth(decodeResponse) {
    _userAuth?.userData = decodeResponse["user"];
    _userAuth?.token = decodeResponse["token"];
    notifyListeners();
  }

  get getUserToken {
    return _userAuth?.token;
  }

  get getUserData {
    return _userAuth;
  }
}

class UserData {
  Map<String, dynamic>? userData;
  String? token;
  UserData._();
  factory UserData() {
    return UserData._();
  }
  setAuthData(decodeResponse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userData = decodeResponse["user"];
    token = decodeResponse["token"];
    await prefs.setString(
        'user-data', jsonEncode(decodeResponse["user"]) as String);
    await prefs.setString('token', decodeResponse["token"]);
  }

  setLocalAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? localToken = prefs.getString('token');
    final String? stringUserData = prefs.getString('user');
    if (localToken!.isNotEmpty && stringUserData!.isNotEmpty) {
      userData = jsonDecode(stringUserData);
      token = localToken;
      print(userData);
      print(userData);
    }
  }

  get getUserToken {
    return token;
  }

  get getUserData {
    return userData;
  }

  get userIsLogged {
    return userData!.isNotEmpty && token!.isNotEmpty;
  }
}
