import 'package:flutter/material.dart';

import '../composables/useGetTextVariant.dart';

class BPasswordTile extends StatelessWidget {
  final String? label;
  final String? password;
  final String? name;
  const BPasswordTile({Key? key, this.label, this.password, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        title: Text(
          label ?? 'NA',
          style: useGetTextVariant('text-1', color: Colors.white),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name ?? 'NA',
              style: useGetTextVariant('text-2', color: Colors.white),
            ),
            Text(
              password ?? 'NA',
              style: useGetTextVariant('text-2', color: Colors.white),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Colors.white)),
      ),
    );
  }
}
