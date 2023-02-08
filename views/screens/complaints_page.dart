import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/item_complaint_widget.dart';
import '../widgets/university_and_inverstor_item_navigation_widget.dart';

class ComplaintsPage extends StatelessWidget {
  

  const ComplaintsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backGround.jpg"),
                fit: BoxFit.cover)),
        child: CupertinoPageScaffold(
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
const Positioned(top: 0, left: 0,right: 0,
  child:   UniversityAndInvestorItemNavigationWidget(title: "Students Complaints")),
            Positioned( top: 120,  left: 0 , right: 0,
              child: SingleChildScrollView(
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children:  const [
                    ItemComplaintsWidget()
                  ]),
              ),
            ),]
            )));
  }
}
