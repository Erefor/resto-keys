import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF18a058);
const Color mainBackground = Color(0xFF101014);

const inputStyles = InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.zero),
        borderSide: BorderSide(width: 3, color: Colors.red)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.zero),
        borderSide: BorderSide(width: 3, color: Colors.red)),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(width: 3, color: mainColor)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(width: 3, color: mainColor)));
final buttonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: mainColor,
        textStyle: const TextStyle(color: Colors.white),
        primary: mainColor));
