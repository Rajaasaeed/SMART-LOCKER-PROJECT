import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'signin_page.dart';
import 'signup_page.dart';

class ChooseTypeSignPage extends StatelessWidget {
  const ChooseTypeSignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backGround.jpg'),
                fit: BoxFit.cover)),
        child: CupertinoPageScaffold(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    color: const Color.fromARGB(255, 224, 208, 207),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Text("sign in".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26)),
                  ),
                  const SizedBox(height: 100),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    color: const Color.fromARGB(255, 224, 208, 207),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Text("sign up".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26)),
                  ),
                ],
              ),
            )));
  }
}
