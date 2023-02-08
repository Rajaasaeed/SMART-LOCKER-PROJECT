import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:provider/provider.dart';

import '../../controllers/user_controller.dart';
import '../widgets/cryptor.dart';
import '../../models/user_model.dart';
import '../widgets/input_field_widget.dart';
import '../widgets/myIndicator.dart';
import '../widgets/signup_navigation_bar_widget.dart';
import '../widgets/snackbar.dart';
import 'signin_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lasttNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confierPasswordController = TextEditingController();
  TextEditingController typeUserController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lasttNameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confierPasswordController.dispose();
    typeUserController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserController>(context);
//safeArea
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backGround.jpg"),
                fit: BoxFit.cover)),
        child: Scaffold(
           appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26)),
                  ),
                ],
              ),
            ),
          ),
            backgroundColor: Colors.transparent,
            body:
              SingleChildScrollView(
                child: Column(
                    children: [
                      Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(children: [
                            InputFieldWidget(
                              placeholder: "First Name",
                              controller: firstNameController,
                            ),
                            InputFieldWidget(
                              placeholder: "Last Name",
                              controller: lasttNameController,
                            ),
                            InputFieldWidget(
                              placeholder: "Username",
                              controller: usernameController,
                            ),
                            EmailFieldWidget(controller: emailController),
                            InputFieldWidget(
                                placeholder: "Phone Number",
                                controller: phoneController,
                                isPhone: true),
                            InputFieldWidget(
                                placeholder: "Password",
                                controller: passwordController,
                                isPassword: true),
                            RepeatPasswordFieldWidget(
                                controller: confierPasswordController,
                                password: passwordController),
                            // InputFieldWidget(
                            //   placeholder: "Type of user",
                            //   controller: typeUserController,
                            // ),
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: CupertinoFormRow(
                                    child: DropdownButtonFormField(
                                        elevation: 0,
                                        hint: const Text("Type of user"),
                                        items: const [
                                          DropdownMenuItem(
                                            value: "user",
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal:8.0),
                                              child: Text('User'),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: "invistor",
                                            child: Text('Invistor'),
                                          ),
                                          DropdownMenuItem(
                                            value: "university",
                                            child: Text('University'),
                                          ),
                                        ],
                                        onChanged: (String? select) {
                                          setState(() {
                                            typeUserController.text = select!;
                                          });
                                        }))),
                            Consumer<UserController>(
                                builder: ((context, value, child) =>
                                    CupertinoButton(
                                        color: const Color.fromARGB(
                                            255, 224, 208, 207),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 10),
                                        borderRadius: BorderRadius.circular(20),
                                        child: !data.isLoadeSin
                                            ? Text("SIGN UP",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold))
                                            : MyActivityIndicator(),
                                        onPressed: () async {
                                          final isValidForm =
                                              formKey.currentState!.validate();
                                          if (isValidForm) {
                                            await data.userSignUp(
                                                userModel: UserModel(
                                                    fristName:
                                                        firstNameController
                                                            .text,
                                                    lastName:
                                                        lasttNameController
                                                            .text,
                                                    username:
                                                        usernameController.text,
                                                    email: emailController.text,
                                                    password: Cryptor()
                                                        .passwordEncryption(
                                                            passwordController
                                                                .text),
                                                    phone: 
                                                        phoneController.text,
                                                    typeUser: typeUserController
                                                        .text));
              
                                            if (value.subscribed == 0) {
                                              print('success');
                                              data.subscribed = null;
                                              SnaCkBarMessage()
                                                  .showSuccessSnackBar(
                                                      message:
                                                          "SignUp successfully.",
                                                      context: context);
              
                                              Navigator.pushReplacement(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          const SignInPage()));
                                            } else if (value.subscribed == 1) {
                                              print('username used');
                                              value.subscribed = null;
                                              SnaCkBarMessage().showErrorSnackBar(
                                                  message:
                                                      "username used please try again. ",
                                                  context: context);
                                            } else if (value.subscribed == 2) {
                                              print('email used');
                                              value.subscribed = null;
                                              SnaCkBarMessage().showErrorSnackBar(
                                                  message:
                                                      "email used please try again. ",
                                                  context: context);
                                            } else {
                                              print('server error');
                                              value.subscribed = null;
                                              SnaCkBarMessage()
                                                  .showErrorSnackBar(
                                                      message:
                                                          "Server Error!!. ",
                                                      context: context);
                                            }
                                          } else {
                                            SnaCkBarMessage().showErrorSnackBar(
                                                message: "Form don`t Valid. ",
                                                context: context);
                                          }
                                        }))),
                          ])),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Alerady have account?".toUpperCase(),
                              style: const TextStyle(color: Colors.blue),
                            )
                          ])
                    ]),
              ),
            ));
  }
}

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const EmailFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CupertinoFormRow(
          child: CupertinoTextFormFieldRow(
        validator: ((value) {
          final validator =
              Validator(validators: [RequiredValidator(), EmailValidator()]);

          return validator.validate(
              context: context, label: 'Email', value: value);
        }),
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.start,
        padding: const EdgeInsets.all(5),
        controller: controller,
        placeholder: "Email",
      )),
    );
  }
}

class RepeatPasswordFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController password;

  const RepeatPasswordFieldWidget({
    Key? key,
    required this.controller,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CupertinoFormRow(
          child: CupertinoTextFormFieldRow(
        validator: ((value) {
          if (value != password.text) {
            return 'Repeat Password not equal password';
          } else {
            return null;
          }
        }),
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        padding: const EdgeInsets.all(5),
        controller: controller,
        obscureText: true,
        textInputAction: TextInputAction.next,
        placeholder: "Repeat Password",
      )),
    );
  }
}
