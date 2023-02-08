import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/locker.dart';
import '../../models/room.dart';
import '../screens/bayWithVisa.dart';


class CustomeDialog{
        
  static void customeShowDialog(context, txt,LockerModel locker,List<RoomModel> rooms,String sellectedIndex,String startDate,String endDate) {
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
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
                isDestructiveAction: true,
              ),
              CupertinoDialogAction(
                textStyle: TextStyle(color: Colors.blue),
                child: Text('CONFIRM'),
                onPressed: () {
                   Navigator.pop(context);
   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PayWithVisa(locker:locker ,rooms:rooms,sellectedIndex:sellectedIndex,startDate: startDate,endDate: 
   endDate,)));

                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }
}