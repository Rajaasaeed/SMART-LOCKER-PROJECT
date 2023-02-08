import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/general_navigation_widget.dart';
import 'new_password_page.dart';


class MessageSendEmailPage extends StatelessWidget {
  const MessageSendEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backGround.jpg"),
                fit: BoxFit.cover)),
        child: CupertinoPageScaffold(
            backgroundColor: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 50),
                    const GeneralNavigation(),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "sign in".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 160),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Icon(
                        Icons.mark_email_read_rounded,
                        size: 50,
                        color: Color.fromARGB(255, 70, 34, 21),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: Center(
                        child: Text(
                          "we sent an email , please check it".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 34, 21)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 90),
                    Center(
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 224, 208, 207),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>  const NewPasswordPage()));
                        },
                        child: Text("done".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 26)),
                      ),
                    ),
                  ]),
            )));
  }
}
