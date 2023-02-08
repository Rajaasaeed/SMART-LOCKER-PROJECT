import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemAccountWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final dynamic pageRoute;

  const ItemAccountWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.pageRoute});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // InvestorDataSource().getComplaints();
        // InvestorDataSource().tttt();

        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => pageRoute));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 50),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              icon,
              color: Colors.black,
              size: 36,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title.toUpperCase(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
