import 'package:flutter/material.dart';
import 'package:resto_keys/components/BInput.dart';

import '../classes/ApiClient.dart';
import '../classes/EncrypterHandler.dart';

class RegistarPage extends StatefulWidget {
  const RegistarPage({Key? key}) : super(key: key);

  @override
  State<RegistarPage> createState() => _RegistarPageState();
}

class _RegistarPageState extends State<RegistarPage> {
  final api = ApiClient();
  String email = '';
  String userName = '';
  String password = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      BInput(
                        errorText: null,
                        label: 'Correo',
                        onChange: (controller, value) {
                          email = value;
                          setState(() {});
                        },
                      ),
                      BInput(
                        label: 'Nombre de usuario',
                        onChange: (cotroller, value) {
                          userName = value;
                          setState(() {});
                        },
                      ),
                      BInput(
                        label: 'Contraseña',
                        onChange: (controller, value) {
                          password = value;
                          setState(() {});
                        },
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              maximumSize: Size(150, 60),
                              backgroundColor:
                                  canRequest ? Colors.blueAccent : Colors.grey,
                              fixedSize: const Size(150, 60)),
                          onPressed: () {
                            if (canRequest) {
                              registerUser();
                            }
                          },
                          child: const Text(
                            'Registrarse',
                          )),
                    ],
                  ),
                )),
    );
  }

  bool get canRequest {
    final passwordRegex = RegExp('.{6}');
    passwordRegex.hasMatch(password);
    if (passwordRegex.hasMatch(password) && email != '' && userName != '') {
      return true;
    }
    return false;
  }

  registerUser() async {
    try {
      final encryptedPassword = EncrypterHandler.encryptPassword(password);
      final decryptedPassword =
          EncrypterHandler.decodePassword('9/6mNOEjHn6gSQ9IIZM=');
      final api = ApiClient();
      api.createUser(userName, email, encryptedPassword);
      isLoading = true;
      setState(() {});
      isLoading = false;
      setState(() {});
    } catch (e) {
      print(e);
      isLoading = false;
      setState(() {});
    }
  }
}
