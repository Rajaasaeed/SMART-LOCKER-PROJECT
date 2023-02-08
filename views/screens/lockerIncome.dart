import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/PervoneLocker.dart';



class LockerIncome extends StatelessWidget {
  const LockerIncome({Key? key}) : super(key: key);

static const TextStyle styleText=TextStyle(
fontSize: 19,
color: Color.fromARGB(255, 107, 100, 100));

  static void customeShowDialog(context, txt) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            
            title: Text('Confurm payment'),
            content: const Text(
              '-The booking can not be canaeled or refunded. \n -any extra time after the specificed end time will cost extra [ayment.',
              style: TextStyle(fontSize: 15),
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
                isDestructiveAction: true,
              ),
              CupertinoDialogAction(
                textStyle: TextStyle(color: Colors.blue),
                child: Text('CONFIRM'),
                onPressed: () {
              
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }
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
            color: Color.fromARGB(255, 243, 172, 171),
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
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    Text(
                      'Locker Income',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only( left: 20, right: 20,bottom: 0),
            height: height * 0.87,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/backGround.jpg'),
              fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PrevOneLocker(lockerIndex: 5),
                  const Text('Locker ID: 212',style: styleText,),
                  const Text('Location: Building 3 at first floor , room 12',style: styleText,),
                  const Text('Student: Free',style: styleText,),
                  const Text('income: 300 SAR',style: styleText,),
                 const  SizedBox(height: 10,),
                
               
                
                ],
              ),
            )
            
            
       
          ),
        ],
      ),
    ));
  }
}
