import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/button.dart';

class LocationPermiss extends StatelessWidget {
  const LocationPermiss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(

        child: Container(
      child: Column(
        children: [
        const  CustomeAppBar(
            icon:  Icons.arrow_back_ios,
           title: 'Location Permission',
            isHome: false),

          Container(
            height: height * 0.87,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/backGround.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 30),
                  height: height * 0.18,
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Allow Application to access your location',
                        style: TextStyle(
                            color: Color.fromARGB(255, 142, 121, 146),
                            fontSize: 25),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    
                    MyButton(
                      backColor: Color(0xFFa82f00),
                      textColor: Colors.white,
                      txt: 'DENNY',
                      icn: Icons.close,
                      onPrs: (){},
                      buttonWidth:180,
                    ),

                    MyButton(
                      backColor: Color(0xFFe4d6d6),
                      textColor: Colors.black,
                      txt: 'ALLOW',
                      icn: Icons.done,
                      onPrs: (){},
                      buttonWidth:180,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
