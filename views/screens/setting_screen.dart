import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../controllers/user_controller.dart';
import '../widgets/input_field_widget.dart';
import '../widgets/myIndicator.dart';
import '../widgets/snackbar.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lasttNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserController>(context);
    usernameController.text = data.usernameS;
    firstNameController.text = data.firstS;
    lasttNameController.text = data.lastS;
    phoneController.text = data.phoneS;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backGround.jpg"),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: CupertinoButton(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 26,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Setting",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26)),
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(height: 30),
              Form(
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
                InputFieldWidget(
                    placeholder: "Phone Number",
                    controller: phoneController,
                    isPhone: true),
                const SizedBox(height: 30),
                Consumer<UserController>(
                  builder: ((context, value, child) => Center(
                        child: CupertinoButton(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 224, 208, 207),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: !data.isLoadeSin
                                ? const Text("UPDATE",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold))
                                : const MyActivityIndicator(),
                            onPressed: () async {
                                      if (firstNameController.text.isNotEmpty &&
                                       lasttNameController.text.isNotEmpty && phoneController.text.isNotEmpty &&usernameController.text.isNotEmpty) {
                              value.updataInfo(
                                  firstName: firstNameController.text,
                                  lastName: lasttNameController.text,
                                  phone: phoneController.text,
                                  username: usernameController.text);

                              if (value.updated == true) {
                                print("ok update");
                                value.updated = null;

                                SnaCkBarMessage().showSuccessSnackBar(
                                    message: "successfully  modified.", context: context);
                                // Navigator.pushReplacement(
                              }
                              if (value.updated == false) {
                                print("error");
                                value.updated = null;
                                SnaCkBarMessage().showErrorSnackBar(
                                      message: "Server error!!. ",
                                      context: context);
                              }

                                      } else {
                                        SnaCkBarMessage().showErrorSnackBar(
                                            message: "Form don`t Valid. ",
                                            context: context);
                                      }
                            }),
                      )),
                )
              ]))
            ],
          )),
        ),
      ),
    );
  }
}
