import 'package:flutter/material.dart';
import 'package:resto_keys/components/BInput.dart';
import 'package:resto_keys/composables/useGetTextVariant.dart';
import 'package:resto_keys/composables/useServices.dart';
import 'package:resto_keys/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userEmail = '';
  String userPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Iniciar sesión',
                style: useGetTextVariant('subtitle-1', fontWeight: 500),
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
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              maximumSize: Size(150, 60),
                              backgroundColor: Colors.blueAccent,
                              fixedSize: const Size(150, 60)),
                          onPressed: () {
                            login(context);
                          },
                          child: const Text(
                            'Iniciar sesión',
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistarPage()));
                          },
                          child: Text('Registrarse'))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    final api = ApiClient();
    try {
      final response = await api.login(userEmail, userPassword);
      print(response);
      Navigator.pushReplacementNamed(context, '/passwords');
    } catch (e) {
      print(e);
    }
  }
}
