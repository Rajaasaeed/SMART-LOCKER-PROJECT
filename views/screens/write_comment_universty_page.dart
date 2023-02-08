import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/user_controller.dart';
import '../../models/complaint_model.dart';
import '../widgets/snackbar.dart';
import '../widgets/university_and_inverstor_item_navigation_widget.dart';

class WriteCommentUniverstyPage extends StatefulWidget {
  const WriteCommentUniverstyPage({Key? key}) : super(key: key);

  @override
  State<WriteCommentUniverstyPage> createState() => _WriteCommentUniverstyPageState();
}

class _WriteCommentUniverstyPageState extends State<WriteCommentUniverstyPage> {
  TextEditingController messageController = TextEditingController();
@override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
      TextEditingController messageController = TextEditingController();

     var data = Provider.of<UserController>(context, listen: false);

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backGround.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const UniversityAndInvestorItemNavigationWidget(
                        title: "Write Comment"),
                    const SizedBox(height: 70),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 180,
                      width: double.infinity,
                      child: CupertinoTextField(
                        controller: messageController,
                        placeholder: 'Write comment to your university',
                        placeholderStyle:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Consumer<UserController>(
                        builder: ((context, value, child) => Center(
                              child: SizedBox(
                                width: 300,
                                child: CupertinoButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  color:
                                      const Color.fromARGB(255, 202, 176, 176),
                                  borderRadius: BorderRadius.circular(50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(Icons.comment,
                                          size: 25, color: Colors.black),
                                      Text(
                                        'SUBMIT COMMENT',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {
                                   final random = Random();
                                    String studentId = value.userId;
                                    String studentName = value.firstS;
                                    int complaintNum = random.nextInt(100000);

                                    if (messageController.text.isNotEmpty) {
                                      await data.writeCommentForUniversity(
                                          complaintModel: ComplaintModel(
                                        complaintNum: complaintNum,
                                        studentId: studentId,
                                        studentName: studentName,
                                        message: messageController.text,
                                      ));
                                      if (value.commentForUniversity == true) {
                                        SnaCkBarMessage().showSuccessSnackBar(
                                            message:
                                                "successfully submit comment.",
                                            context: context);
                                        value.commentForUniversity = null;
                                        Navigator.pop(context);
                                      }
                                    } else if (messageController.text.isEmpty) {
                                      SnaCkBarMessage().showErrorSnackBar(
                                          message: "Form don`t Valid. ",
                                          context: context);
                                    } else {
                                      SnaCkBarMessage().showErrorSnackBar(
                                          message: "Server Error!! . ",
                                          context: context);
                                      value.commentForUniversity = null;
                                    }
                                  

                                  },
                                ),
                              ),
                            )))
                  ]),
            )));
  }
}