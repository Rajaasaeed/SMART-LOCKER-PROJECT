// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/user_controller.dart';
import '../widgets/general_navigation_widget.dart';
import '../widgets/snackbar.dart';
import 'message_send_email_page.dart';
import 'signup_page.dart';

class ForgatPasswordPage extends StatelessWidget {
  const ForgatPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backGround.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 100),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          child: const Text(
                            "Enter Your Email",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                        EmailFieldWidget(controller: emailController),
                        const SizedBox(height: 100),
                        SendEmailWidget(email: emailController)
                      ],
                    ),
                  ]),
            )));
  }
}

class SendEmailWidget extends StatelessWidget {
  final TextEditingController email;
  const SendEmailWidget({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserController>(context, listen: false);

    return Consumer<UserController>(
        builder: ((context, value, child) => Center(
            child: CupertinoButton(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 224, 208, 207),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: const Text("DONE",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                onPressed: () async {
                  if (email.text.trim().isNotEmpty) {
                    await data.forgatPassword(email: email.text.trim());
                    if (value.checkEmail == true) {
                      value.checkEmail = null;
                      SnaCkBarMessage().showSuccessSnackBar(
                          message: "Verification code has been sent. ",
                          context: context);
                            Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const MessageSendEmailPage()));
                    } else if (value.checkEmail == false) {
                      value.checkEmail = null;
                      SnaCkBarMessage().showErrorSnackBar(
                          message: "Email not found. ", context: context);
                    } else {
                      SnaCkBarMessage().showErrorSnackBar(
                          message: "Server Error!!. ", context: context);
                    }
                  
                  } else {
                    SnaCkBarMessage().showErrorSnackBar(
                        message: "Email is Empty. ", context: context);
                  }
                }))));
  }
}
