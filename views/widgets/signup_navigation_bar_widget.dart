import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpNavigationBar extends StatelessWidget {
  const SignUpNavigationBar({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CupertinoButton(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 26,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Container(
              margin: const EdgeInsets.only(left: 100),
              child:  const Text("Sign Up",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
