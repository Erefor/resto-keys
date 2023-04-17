import 'package:flutter/material.dart';

TextStyle useGetTextVariant(String variant,
    {Color color = Colors.black, int fontWeight = 100}) {
  final fontColor = color ?? Colors.black;
  final fontWeightsMap = {
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w400,
    500: FontWeight.w500,
    600: FontWeight.w600,
    700: FontWeight.w700,
    800: FontWeight.w800,
    900: FontWeight.w900,
  };
  final variantsMap = {
    'title-1': TextStyle(
        fontSize: 64,
        fontWeight: fontWeightsMap[fontWeight],
        fontStyle: FontStyle.normal,
        color: fontColor),
    'title-2': TextStyle(
        fontSize: 48,
        fontWeight: fontWeightsMap[fontWeight],
        fontStyle: FontStyle.normal,
        color: fontColor),
    'subtitle-1': TextStyle(
        fontSize: 40,
        fontWeight: fontWeightsMap[fontWeight],
        fontStyle: FontStyle.normal,
        color: fontColor),
    'subtitle-2': TextStyle(
        fontSize: 36,
        fontWeight: fontWeightsMap[fontWeight],
        fontStyle: FontStyle.normal,
        color: fontColor),
    'text-1': TextStyle(
        fontSize: 24,
        fontWeight: fontWeightsMap[fontWeight],
        fontStyle: FontStyle.normal,
        color: fontColor),
    'text-2': TextStyle(
        fontSize: 16,
        fontWeight: fontWeightsMap[fontWeight],
        fontStyle: FontStyle.normal,
        color: fontColor),
  };
  return variantsMap[variant]! ?? variantsMap['text-1']!;
}
