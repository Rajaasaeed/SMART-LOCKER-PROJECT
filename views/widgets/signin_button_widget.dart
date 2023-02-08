// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/user_controller.dart';
import '../screens/investor_home_page.dart';
import '../screens/profile.dart';
import '../screens/university_home_page.dart';
import 'myIndicator.dart';
import 'snackbar.dart';

class SigninButtonWidget extends StatelessWidget {
  final TextEditingController username;
  final TextEditingController password;

  const SigninButtonWidget(
      {super.key, required this.username, required this.password});

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
                child: !data.isLoadeSin
                    ? Text("DONE",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold))
                    : MyActivityIndicator(),
                onPressed: () async {
                  print(username.text);
                  print(password.text);
                  print('clickkkkk');
                  if (username.text.isNotEmpty && password.text.isNotEmpty) {
                    await data.userSignIn(
                        username: username.text, password: password.text);
                    if (value.logined == true) {
                      print(value.userType);
                      if (value.userType == "user") {
                        print('user');
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const ProfileScreen()));
                      } else if (value.userType == "invistor") {
                        print('invistor');
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const InvestorHomePage()));
                      } else if (value.userType == "university") {
                        print('unversity');
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const UniversityHomePage()));
                      } else {
                        print('student');
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const ProfileScreen()));
                      }
                      data.logined = null;
                    } else if (value.logined == false) {
                      print("username or password Incorrect.");
                      SnaCkBarMessage().showErrorSnackBar(
                          message: "username or password Incorrect.",
                          context: context);
                      data.logined = null;
                    }
                  } else {
                    SnaCkBarMessage().showErrorSnackBar(
                        message: "Form don`t Valid. ", context: context);
                  }
                }),
          )),
    );
  }
}
