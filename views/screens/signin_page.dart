import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/general_navigation_widget.dart';
import '../widgets/signin_button_widget.dart';
import '../widgets/input_field_widget.dart';
import 'forgat_password_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                mainAxisSize: MainAxisSize.min,
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
                      padding: EdgeInsets.zero,
                      
                      children: [
                        const SizedBox(height: 60),
                        InputFieldWidget(
                            placeholder: "Username",
                            controller: usernameController,
                            isPassword: false),
                        const SizedBox(height: 30),
                        InputFieldWidget(
                            placeholder: "Password",
                            controller: passwordController,
                            isPassword: true),
                       Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
               Navigator.push(
                      context, CupertinoPageRoute(builder: (context)=> const ForgatPasswordPage())
                    );
            },
            child: const Text("Forgat Password?"),
          )
        ],
      ),
    )
  ,
                        const SizedBox(height: 50),
                        SigninButtonWidget(
                            username: usernameController,
                            password: passwordController)
                      ]),
                ],
              ),
            )));
  }
}
