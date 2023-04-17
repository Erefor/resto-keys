import 'package:flutter/material.dart';
import 'package:resto_keys/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resto Keys',
      initialRoute: '/',
      routes: {'/': (BuildContext context) => const LoginPage()},
    );
  }
}
