import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:resto_keys/classes/EncrypterHandler.dart';

import '../composables/useGetTextVariant.dart';

class BPasswordTile extends StatefulWidget {
  final String? label;
  final String? password;
  final String? name;
  const BPasswordTile({Key? key, this.label, this.password, this.name})
      : super(key: key);

  @override
  State<BPasswordTile> createState() => _BPasswordTileState();
}

class _BPasswordTileState extends State<BPasswordTile> {
  bool showUncryptedPassword = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(widget.label ?? 'NA',
            style: useGetTextVariant('text-1',
                color: Colors.white, fontWeight: 500),
            overflow: TextOverflow.ellipsis),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name ?? 'NA',
              style: useGetTextVariant('text-2',
                  color: Colors.white, fontWeight: 400),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              passwordText ?? 'NA',
              style: useGetTextVariant('text-2',
                  color: Colors.white, fontWeight: 300),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(showUncryptedPassword
                  ? Icons.visibility_off
                  : Icons.remove_red_eye),
              color: Colors.white,
              onPressed: () {
                showUncryptedPassword = !showUncryptedPassword;
                setState(() {});
              },
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Colors.white)),
      ),
    );
  }

  void togglePasswordVisibility() {}

  get passwordText {
    if (widget.password == null || widget.password == '') return 'NA';
    return showUncryptedPassword
        ? EncrypterHandler.decodePassword(widget.password as String)
        : widget.password;
  }
}
