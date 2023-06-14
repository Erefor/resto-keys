import 'package:flutter/material.dart';
import 'package:resto_keys/classes/ApiClient.dart';
import 'package:resto_keys/components/BPasswordTile.dart';
import 'package:resto_keys/constants/Colors.dart';

class PasswordsListView extends StatelessWidget {
  const PasswordsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final api = ApiClient();
    return Scaffold(
      backgroundColor: mainBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/create-password');
        },
        backgroundColor: mainColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder(
          builder: builderFunction,
          initialData: [],
          future: api.getUserPasswords(),
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
      return passwordsList(snapshot.data['data'], context);
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: const CircularProgressIndicator());
    }
    return Center(child: const CircularProgressIndicator());
  }

  Widget passwordsList(List data, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 250,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BPasswordTile(
                  label: data[index]['label'],
                  password: data[index]['value'],
                  name: data[index]['direction'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
