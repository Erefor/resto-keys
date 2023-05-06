import 'package:flutter/material.dart';
import 'package:resto_keys/components/BInput.dart';
import 'package:resto_keys/composables/useServices.dart';

class RegistarPage extends StatefulWidget {
  const RegistarPage({Key? key}) : super(key: key);

  @override
  State<RegistarPage> createState() => _RegistarPageState();
}

class _RegistarPageState extends State<RegistarPage> {
  String email = '';
  String userName = '';
  String password = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
            ),
            BInput(
              label: 'Correo',
              onChange: (controller, value) {
                email = value;
              },
            ),
            BInput(
              label: 'Nombre de usuario',
              onChange: (cotroller, value) {
                userName = value;
              },
            ),
            BInput(
              label: 'Contraseña',
              onChange: (controller, value) {
                password = value;
              },
            ),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    maximumSize: Size(150, 60),
                    backgroundColor: Colors.blueAccent,
                    fixedSize: const Size(150, 60)),
                onPressed: () {
                  registerUser();
                },
                child: const Text(
                  'Registrarse',
                )),
          ],
        ),
      )),
    );
  }

  registerUser() async {
    try {
      isLoading = true;
      final response = await useRegisUser(email, userName, password);
      isLoading = false;
    } catch (e) {
      print('Error abajo');
      isLoading = false;
      print(e);
    }
  }
}
