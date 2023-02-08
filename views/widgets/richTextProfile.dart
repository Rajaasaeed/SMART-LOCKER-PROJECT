import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  const MyRichText(
      {Key? key, required this.firstText, required this.secondText})
      : super(key: key);
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 17),
         children: <TextSpan>[
          
        TextSpan(text: firstText, style: const TextStyle(color: Colors.red)),
        TextSpan(text: secondText, style: const TextStyle(color: Colors.black)),
      ]),
    );
  }
}
