import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'choose_type_sign_page.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Column(
          mainAxisSize: MainAxisSize.max,
          children:   [
            const SizedBox(height: 150),
             Container(
          height: 150,
          width: 330,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/loglo.jpg"),
                  fit: BoxFit.cover))),
 
            const SizedBox(height: 80),
           const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "SMART LOCKERS",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
          CupertinoButton(
        padding:  const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        color:  const Color.fromARGB(230, 245, 216, 216),
        borderRadius: BorderRadius.circular(20),
        child:   Text("WELCOME",
            style:  TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        onPressed:(){
           Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ChooseTypeSignPage()));
        }),
          ],
              ),
            ),
        ));
  }
}
