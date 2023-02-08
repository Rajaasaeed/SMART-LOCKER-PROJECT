import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/item_account_widget.dart';
import '../widgets/university_and_inverstor_navigation_widget.dart';
import 'complaints_page.dart';
import 'statisics_page.dart';


class UniversityHomePage extends StatelessWidget {
  const UniversityHomePage({Key? key}) : super(key: key);

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
                  UniversityAndInvestorNavigationWidget(
                      title: "University Account"),
                  SizedBox(height: 60),
                  ItemAccountWidget(
                      icon: Icons.data_thresholding_outlined,
                      title: "statistics",
                      pageRoute: StatisticsPage()),
                  ItemAccountWidget(
                      icon: Icons.emoji_people_outlined,
                      title: "complaints",
                      pageRoute: ComplaintsPage()),
                ]))));
  }
}
