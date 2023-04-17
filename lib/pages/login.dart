import 'package:flutter/material.dart';
import 'package:resto_keys/components/BInput.dart';
import 'package:resto_keys/composables/useGetTextVariant.dart';

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
              SizedBox(
                height: 24,
              ),
              BInput(
                label: 'Contraseña',
                obscureText: true,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(350, 60)),
                  onPressed: () {},
                  child: const Text(
                    'Iniciar sesión',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
