import 'package:flutter/material.dart';
import 'package:resto_keys/composables/useGetTextVariant.dart';

class BButton extends StatefulWidget {
  final String? textVariant;
  final String? buttonText;
  final onPressed;
  const BButton(
      {Key? key,
      this.textVariant = 'text-1',
      required this.onPressed,
      this.buttonText})
      : super(key: key);

  @override
  State<BButton> createState() => _BButtonState();
}

class _BButtonState extends State<BButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonText ?? 'Texto de boton',
          style: useGetTextVariant(widget.textVariant ?? 'text-1',
              fontWeight: 400, color: Colors.white),
        ));
  }
}
