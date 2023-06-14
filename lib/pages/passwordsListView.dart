import 'package:flutter/material.dart';
import 'package:resto_keys/classes/ApiClient.dart';
import 'package:resto_keys/components/BButton.dart';
import 'package:resto_keys/components/BPasswordTile.dart';
import 'package:resto_keys/composables/useGetTextVariant.dart';
import 'package:resto_keys/constants/Colors.dart';

class PasswordsListView extends StatelessWidget {
  const PasswordsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final api = ApiClient();
    return Scaffold(
      backgroundColor: mainBackground,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              BButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, '/create-password')},
                buttonText: 'Crear contraseña',
              ),
              FutureBuilder(
                builder: builderFunction,
                initialData: [],
                future: api.getUserPasswords(),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget builderFunction(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return const Text(
          'Hay un error',
          style: TextStyle(color: Colors.white),
        );
      }
      print(snapshot.data);
      return passwordsList(snapshot.data['data']);
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }
    return const CircularProgressIndicator();
  }

  Widget passwordsList(List data) {
    return SizedBox(
      width: 350,
      height: 450,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return BPasswordTile(
            label: data[index]['label'],
            password: data[index]['value'],
            name: data[index]['direction'],
          );
        },
      ),
    );
  }
}
