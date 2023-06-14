import 'package:flutter/material.dart';
import 'package:resto_keys/components/BButton.dart';
import 'package:resto_keys/constants/Colors.dart';

import '../classes/ApiClient.dart';
import '../classes/EncrypterHandler.dart';
import '../components/BInput.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({Key? key}) : super(key: key);

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  String password = '';

  String label = '';

  String direction = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackground,
      appBar: AppBar(
        backgroundColor: mainColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                BInput(
                    errorText: isValidPassword ? 'Contraseña inválida' : null,
                    label: 'Contraseña',
                    onChange: (controller, value) {
                      password = value;
                    }),
                BInput(
                  label: 'Nombre',
                  onChange: (controller, value) {
                    label = value;
                  },
                ),
                BInput(
                    label: 'Dirección o email',
                    onChange: (controller, value) {
                      direction = value;
                    }),
                BButton(
                  onPressed: () {
                    createPassword(context);
                  },
                  buttonText: 'Crear contraseña',
                ),
                BButton(
                  onPressed: () {
                    Navigator.restorablePushReplacementNamed(
                        context, '/passwords');
                  },
                  buttonText: 'Volver',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  get isValidPassword {
    return password.length > 6;
  }

  void createPassword(BuildContext context) async {
    final api = ApiClient();
    try {
      final response =
          await api.createPassword(password, direction, label, direction);
      print(response);
      Navigator.restorablePushReplacementNamed(context, '/passwords');
    } catch (e) {
      print(e);
    }
  }
}
