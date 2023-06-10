import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_keys/classes/UserAuthProvider.dart';
import 'package:resto_keys/constants/Colors.dart';
import 'package:resto_keys/pages/createPasswordView.dart';
import 'package:resto_keys/pages/dashboard.dart';
import 'package:resto_keys/pages/login.dart';
import 'package:resto_keys/pages/passwordsListView.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserAuthProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    UserData().setLocalAuthData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          inputDecorationTheme: inputStyles, textButtonTheme: buttonTheme),
      debugShowCheckedModeBanner: false,
      title: 'Resto Keys',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const LoginPage(),
        '/dashboard': (BuildContext context) => const DashboardPage(),
        '/passwords': (BuildContext context) => const PasswordsListView(),
        '/create-password': (BuildContext context) => const CreatePasswordView()
      },
    );
  }
}
