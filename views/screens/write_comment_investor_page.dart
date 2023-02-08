import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/user_controller.dart';
import '../../models/complaint_model.dart';
import '../widgets/snackbar.dart';
import '../widgets/university_and_inverstor_item_navigation_widget.dart';


class WriteCommentInvestorPage extends StatefulWidget {
  const WriteCommentInvestorPage({Key? key}) : super(key: key);

  @override
  State<WriteCommentInvestorPage> createState() =>
      _WriteCommentInvestorPageState();
}

enum SingingCharacter {
  paymetProblem,
  bookingProblem,
  lockerProblem,
  anotherProblem
}

class _WriteCommentInvestorPageState extends State<WriteCommentInvestorPage> {
  SingingCharacter? _charecter = SingingCharacter.paymetProblem;
  String type = 'Paymet Problem';
  TextEditingController messageController = TextEditingController();

  Widget radioText(txt) {
    return Text(
      txt,
      style: TextStyle(fontSize: 27, color: Colors.grey[600]),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          title: radioText('Paymet Problem'),
                          leading: Transform.scale(
                            scale: 1.5,
                            child: Radio<SingingCharacter>(
                              value: SingingCharacter.paymetProblem,
                              groupValue: _charecter,
                              onChanged: (SingingCharacter? vlaue) {
                                setState(() {
                                  _charecter = vlaue;
                                  type = 'Paymet Problem';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          title: radioText('booking Problem'),
                          leading: Transform.scale(
                            scale: 1.5,
                            child: Radio<SingingCharacter>(
                              value: SingingCharacter.bookingProblem,
                              groupValue: _charecter,
                              onChanged: (SingingCharacter? vlaue) {
                                setState(() {
                                  _charecter = vlaue;
                                  type = 'booking Problem';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          title: radioText('Locker Problem'),
                          leading: Transform.scale(
                            scale: 1.5,
                            child: Radio<SingingCharacter>(
                              value: SingingCharacter.lockerProblem,
                              groupValue: _charecter,
                              onChanged: (SingingCharacter? vlaue) {
                                setState(() {
                                  _charecter = vlaue;
                                  type = 'Locker Problem';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          title: radioText('Another Problem'),
                          leading: Transform.scale(
                            scale: 1.5,
                            child: Radio<SingingCharacter>(
                              value: SingingCharacter.anotherProblem,
                              groupValue: _charecter,
                              onChanged: (SingingCharacter? vlaue) {
                                setState(() {
                                  _charecter = vlaue;
                                  type = 'Another Problem';
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.only(right: 5, left: 2),
                      height: 100,
                      width: double.infinity,
                      child: CupertinoTextField(
                        controller: messageController,
                        placeholder: 'Write comment to investor',
                        placeholderStyle:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                                    String investorId = "01";
                                    String studentId = "dgfhg";
                                    String studentName = "shla";
                                    int complaintNum = random.nextInt(100000);

                                    if (messageController.text.isNotEmpty) {
                                      await data.writeCommentForInvestor(
                                          complaintModel: ComplaintModel(
                                              investorId: investorId,
                                              complaintNum: complaintNum,
                                              studentId: studentId,
                                              studentName: studentName,
                                              message: messageController.text,
                                              type: type));
                                      if (value.commentForInvestor == true) {
                                        SnaCkBarMessage().showSuccessSnackBar(
                                            message:
                                                "successfully submit comment.",
                                            context: context);
                                        value.commentForInvestor = null;
                                      }
                                    } else if (type.isEmpty ||
                                        messageController.text.isEmpty) {
                                      SnaCkBarMessage().showErrorSnackBar(
                                          message: "Form don`t Valid. ",
                                          context: context);
                                    } else {
                                      SnaCkBarMessage().showErrorSnackBar(
                                          message: "Server Error!! . ",
                                          context: context);
                                      value.commentForInvestor = null;
                                    }
                                  },
                                ),
                              ),
                            )))
                  ]),
            )));
  }
}
