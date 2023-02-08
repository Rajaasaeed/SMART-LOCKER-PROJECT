import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../widgets/appBar.dart';
import '../widgets/button.dart';

class WriteCommentUniversty extends StatelessWidget {
 const WriteCommentUniversty({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tobPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [
         const  CustomeAppBar(icon: Icons.arrow_back_ios,
           title: 'write Comment',
           isHome: false),
         
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/backGround.jpg'),
                fit: BoxFit.fill,
              )),

              child: SingleChildScrollView(
                child: Column(
                  children: [
               
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: height*0.22,
                      width: width * 0.95,
                      child: CupertinoTextField(
                        placeholder: 'Write comment to your university',
                        placeholderStyle:
                            TextStyle(fontSize: 20, color: Colors.grey),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyButton(
                      backColor: const Color.fromARGB(255, 202, 176, 176),
                      textColor: Colors.black,
                      txt: 'SUBMIT COMMENT',
                      onPrs: () {},
                      icn: Icons.comment,
                      buttonWidth: 300,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
