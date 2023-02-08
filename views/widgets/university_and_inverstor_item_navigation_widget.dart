import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UniversityAndInvestorItemNavigationWidget extends StatelessWidget {
  final String title;
  const UniversityAndInvestorItemNavigationWidget(
      {Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tobPadding = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      height: tobPadding + 80,
      padding: const EdgeInsets.only(top: 20),
      color: const Color.fromARGB(255, 236, 165, 160),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
