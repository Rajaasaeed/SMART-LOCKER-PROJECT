// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/user_controller.dart';
import '../widgets/general_navigation_widget.dart';
import '../widgets/snackbar.dart';
import '../widgets/input_field_widget.dart';
import 'signin_page.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

  
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 50),
                      const GeneralNavigation(),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          "new password".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView(shrinkWrap: true, children: [
                        const SizedBox(height: 70),
                        InputFieldWidget(
                            placeholder: "password",
                            controller: passwordController,
                            isPassword: true),
                        const SizedBox(height: 25),
                        InputFieldWidget(
                            placeholder: "Confirm Password",
                            controller: confirmPasswordController,
                            isPassword: true),
                        const SizedBox(height: 115),
                        ChangePasswordButtonWidget(
                          password: passwordController,
                          confirmPassword: confirmPasswordController,
                        ),
                      ])
                    ]),
              )));
  }
}

class ChangePasswordButtonWidget extends StatelessWidget {
  final TextEditingController password;
  final TextEditingController confirmPassword;
  const ChangePasswordButtonWidget({
    Key? key,
    required this.password,
    required this.confirmPassword,
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
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    if (confirmPassword.text.isNotEmpty &&
                        password.text.isNotEmpty) {
                      if (password.text == confirmPassword.text) {
                        if (password.text.length >= 8) {
                          await data.changePassword(password: password.text);
                          if (value.passwordChanged == true) {
                            data.passwordChanged = null;
                            SnaCkBarMessage().showSuccessSnackBar(
                                message: "Password changed successfully",
                                context: context);
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const SignInPage()));
                          } else if (value.passwordChanged != true) {
                            data.passwordChanged = null;
                            SnaCkBarMessage().showErrorSnackBar(
                                message: "Error  try agin . ",
                                context: context);
                          } else {
                            SnaCkBarMessage().showErrorSnackBar(
                                message: "Server Error!!. ", context: context);
                          }
                        } else {
                          SnaCkBarMessage().showErrorSnackBar(
                              message: "password at least 8 characters.",
                              context: context);
                        }
                      } else if (confirmPassword.text != password.text) {
                        SnaCkBarMessage().showErrorSnackBar(
                            message: "password not equal. ", context: context);
                      }
                    } else {
                      SnaCkBarMessage().showErrorSnackBar(
                          message: "Form don`t Valid. ", context: context);
                    }
                  }),
            )));
  }
}
