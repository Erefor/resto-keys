import 'package:encrypt/encrypt.dart' as Salsa;
import 'package:flutter/material.dart';
import 'package:resto_keys/components/BInput.dart';
import 'package:resto_keys/composables/useServices.dart';

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
      final key = Salsa.Key.fromLength(32);
      final iv = Salsa.IV.fromLength(8);
      final encrypter = Salsa.Encrypter(Salsa.Salsa20(key));
      final encrypted = encrypter.encrypt(password, iv: iv);
      isLoading = true;
      print(encrypted.base64);
      setState(() {});
      final request = await api.POST(ApiPaths.CreateUser,
          {"password": encrypted.base64, "userName": userName, "email": email});
      print(request);
      isLoading = false;
      setState(() {});
    } catch (e) {
      print(e);
      isLoading = false;
      setState(() {});
    }
  }
}
