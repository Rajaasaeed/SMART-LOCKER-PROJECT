import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/university_and_inverstor_item_navigation_widget.dart';


class IncomePage extends StatelessWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backGround.jpg"),
                fit: BoxFit.cover)),
        child: CupertinoPageScaffold(
            backgroundColor: Colors.transparent,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                  UniversityAndInvestorItemNavigationWidget(
                      title: "Locker Income")
                ]))));
  }
}
