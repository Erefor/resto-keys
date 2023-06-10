import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resto_keys/classes/UserAuthProvider.dart';
import 'package:resto_keys/components/BButton.dart';
import 'package:resto_keys/components/BInput.dart';
import 'package:resto_keys/composables/useGetTextVariant.dart';
import 'package:resto_keys/constants/Colors.dart';
import 'package:resto_keys/pages/register.dart';

import '../classes/ApiClient.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = UserData();
  String userEmail = '';
  String userPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackground,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Iniciar sesión',
                  style: useGetTextVariant('subtitle-1',
                      fontWeight: 500, color: Colors.white),
                ),
                BInput(
                  inputType: TextInputType.emailAddress,
                  label: 'Correo',
                  onChange: (controller, value) {
                    userEmail = value;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                BInput(
                  label: 'Contraseña',
                  obscureText: true,
                  onChange: (controller, value) {
                    userPassword = value;
                  },
                ),
                SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        BButton(
                            onPressed: () {
                              login(context);
                            },
                            buttonText: 'Iniciar sesión'),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegistarPage()));
                            },
                            child: Text(
                              'Registrarse',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    final api = ApiClient();
    try {
      final response = await api.login(userEmail, userPassword);
      final decodeBody = await jsonDecode(response.body);
      auth.setAuthData(decodeBody);
      Navigator.pushReplacementNamed(context, '/passwords');
    } catch (e) {
      print(e);
    }
  }
}
