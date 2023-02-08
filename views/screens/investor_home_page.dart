import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/item_account_widget.dart';
import '../widgets/university_and_inverstor_navigation_widget.dart';
import 'chooseLockerInvestor2.dart';
import 'complaints_page.dart';
import 'lockerIncome.dart';
import 'statisics_page.dart';

class InvestorHomePage extends StatelessWidget {
  const InvestorHomePage({Key? key}) : super(key: key);

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
                    children:  [
                  UniversityAndInvestorNavigationWidget(
                      title: "Investor Account"),
                  SizedBox(height: 60),
                  ItemAccountWidget(
                      icon: Icons.data_thresholding_outlined,
                      title: "statistics",
                      pageRoute: StatisticsPage()),
                  ItemAccountWidget(
                      icon: Icons.emoji_people_outlined,
                      title: "complaints",
                      pageRoute: ComplaintsPage()),
                  ItemAccountWidget(
                      icon: Icons.attach_money,
                      title: "income",
                      pageRoute: LockerIncome()),
                  ItemAccountWidget(
                      icon: Icons.add_circle_outline_sharp,
                      title: "add request",
                      pageRoute: ChooseLockerInvestor2()),
                ]))));
  }
}
