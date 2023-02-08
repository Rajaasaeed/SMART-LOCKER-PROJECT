import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../widgets/button.dart';
import 'write_comment_investor_page.dart';
import 'write_comment_universty_page.dart';

class CommentFor extends StatelessWidget {
 const CommentFor({Key? key}) : super(key: key);


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
          Container(
            padding: EdgeInsets.only(top: tobPadding, right: 20, left: 20),
            height: height * 0.13,
            color: Color.fromARGB(255, 243, 172, 171),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    Text(
                      'Comment for',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              // height: height * 0.87,
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
                      height: 20,
                    ),
                    MyButton(
                      backColor: const Color.fromARGB(255, 202, 176, 176),
                      textColor: Colors.black,
                      txt: 'COMMENT FOR UNIVERSITY',
                      onPrs: () {
                         Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WriteCommentUniverstyPage()));
                      },
                      icn: Icons.school,
                      buttonWidth: width*0.9,

                    ),
SizedBox(height: 20,),
                     MyButton(
                      backColor: const Color.fromARGB(255, 202, 176, 176),
                      textColor: Colors.black,
                      txt: 'COMMENT FOR INVESTOR',
                      onPrs: () {
                         Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WriteCommentInvestorPage()));
                      },
                      icn: Icons.attach_money_outlined,
                      buttonWidth: width*0.9,
                      
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
