import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
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
        ],
      ),
    );
  }

  get isValidPassword {
    return password.length > 6;
  }

  void createPassword(BuildContext context) async {
    final api = ApiClient();
    try {
      final encryptedPassword = EncrypterHandler.encryptPassword(password);
      final response = await api.createPassword(
          encryptedPassword, direction, label, direction);
      print(response);
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }
}
