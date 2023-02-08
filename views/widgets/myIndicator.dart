import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyActivityIndicator extends StatelessWidget {
  const MyActivityIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
                      animating: true,
                      radius: 20,
                      color: Colors.black,);
  }
}