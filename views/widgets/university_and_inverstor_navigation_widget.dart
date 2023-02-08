import 'package:flutter/material.dart';

class UniversityAndInvestorNavigationWidget extends StatelessWidget {
  final String title;

  const UniversityAndInvestorNavigationWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.only(top: 50),
      color: const Color.fromRGBO(236, 165, 160, 1),
      child: Row(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(
            Icons.home,
            color: Colors.black,
            size: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
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
