import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralNavigation extends StatelessWidget {
  const GeneralNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CupertinoButton(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 26,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
