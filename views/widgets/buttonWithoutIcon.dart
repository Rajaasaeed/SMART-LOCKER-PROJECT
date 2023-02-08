import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtonWithoutIcon extends StatelessWidget {
  final Color backColor;
  final Color textColor;
  final String txt;
  final Function onPrs;
  final double buttonWidth;
  const MyButtonWithoutIcon(
      {Key? key,
      required this.backColor,
      required this.textColor,
      required this.txt,
      required this.onPrs, required this.buttonWidth,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        color: backColor,
        borderRadius: BorderRadius.circular(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              txt,
              style: TextStyle(fontSize: 18, color: textColor),
            ),
          ],
        ),
        onPressed:()=>onPrs(),
      ),
    );
  }
}
