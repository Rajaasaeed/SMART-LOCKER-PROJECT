import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color backColor;
  final Color textColor;
  final String txt;
  final IconData icn;
  final Function onPrs;
  final double buttonWidth;
  const MyButton(
      {Key? key,
      required this.backColor,
      required this.textColor,
      required this.txt,
      required this.icn,
      required this.onPrs,
      required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: backColor,
        borderRadius: BorderRadius.circular(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icn, size: 25, color: textColor),
            Text(
              txt,
              style: TextStyle(fontSize: 18, color: textColor),
            ),
          ],
        ),
        onPressed: () => onPrs(),
      ),
    );
  }
}
