import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/locker_line_chart.dart';
import '../widgets/snackbar.dart';
import '../widgets/university_and_inverstor_item_navigation_widget.dart';


class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
              UniversityAndInvestorItemNavigationWidget(
                  title: "Students Statistics"),
              LockerLineChart()
            ])));
  }
}

class SendStatiscsToInvestor extends StatelessWidget {
  final String id;
  const SendStatiscsToInvestor({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CupertinoButton(
            color: const Color.fromARGB(255, 224, 208, 207),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            borderRadius: BorderRadius.circular(20),
            child: Text("send to investors".toUpperCase(),
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              SnaCkBarMessage().showErrorSnackBar(
                  message: " Server Error!!.  ", context: context);
              // SnaCkBarMessage().showSuccessSnackBar(
              //     message: " Successfully sent for investor.", context: context);
            }),
      ),
    );
  }
}
