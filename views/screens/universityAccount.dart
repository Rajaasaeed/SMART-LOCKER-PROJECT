import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../widgets/button.dart';

class UniversityAccount extends StatelessWidget {
 const UniversityAccount({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tobPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: tobPadding, right: 20, left: 20),
            height: height * 0.13,
            color: Color.fromARGB(255, 236, 165, 160),//Color.fromARGB(255, 243, 172, 171),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Icon(
                        Icons.home,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    Text(
                      'University Account',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              
              padding:  EdgeInsets.only(top: 50,left: width*0.17),
              // height: height * 0.87,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/backGround.jpg'),
                fit: BoxFit.fill,
              )),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               
              
                
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                        color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          'STATISTICS',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                            ),
                          ),
                        
                        leading: Icon(Icons.poll_outlined,
                        color: Colors.black,
                        size: 25,
                        ),
                      ),
                    ),

                      Material(
                        color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          'COMPLAINTS',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                            ),
                          ),
                        
                        leading: Icon(Icons.poll_outlined,
                        color: Colors.black,
                        size: 25,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
