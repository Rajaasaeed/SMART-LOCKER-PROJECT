import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String txt;
  final IconData icn;
  const IconText({required this.txt, required this.icn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icn,
          color: Colors.black,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          txt,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
