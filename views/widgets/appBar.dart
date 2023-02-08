import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../screens/setting_screen.dart';
import 'button.dart';

class CustomeAppBar extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isHome;
  const CustomeAppBar(
      {Key? key, required this.icon, required this.title, required this.isHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tobPadding = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(top: tobPadding, right: 20, left: 20),
      height: height * 0.13,
      color: const Color.fromARGB(255, 243, 172, 171),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Material(
                  color: Colors.white.withOpacity(0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      icon,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          isHome
              ? MyButton(
                  backColor: Color.fromARGB(255, 253, 215, 210),
                  textColor: Colors.black,
                  txt: 'settings',
                  icn: Icons.settings,
                  onPrs: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SettingPage()));
                  },
                  buttonWidth: 180,
                )
              : Text(''),
        ],
      ),
    );
  }
}
