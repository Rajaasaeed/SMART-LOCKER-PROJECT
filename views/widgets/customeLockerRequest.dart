import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/room.dart';



class CustomeLockerRequest extends StatelessWidget {
  final String lockerIndex;
  final int col;
  final int row;
  final double lockerWidth;
  final double lockerHeight;
  final List<RoomModel> allRooms;

  
  const CustomeLockerRequest({Key? key, required this.lockerIndex, required this.col, required this.row, required this.lockerWidth, required this.lockerHeight, required this.allRooms}) : super(key: key);

  void showDialog(context, txt) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            
            title: Text('Locker Info'),
            content: Text(
              txt,
              style: TextStyle(fontSize: 30),
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: Text('close'),
                onPressed: () {
                  Navigator.pop(context);
                },
                isDestructiveAction: true,
              )
            ],
          );
        });
  }

  
  int getRoomKey(String lokerId,String roomId){
  var key=allRooms.indexWhere((element) => element.lockerId==lokerId&&element.roomId==roomId);
  return key>=01?key:0;
}




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tobPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double height = MediaQuery.of(context).size.height;

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        padding: EdgeInsets.all(2),
        height:lockerWidth*row+row*2,
        width: lockerWidth*col+col*2,
        color: Colors.white,
        child: GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: col,
                 crossAxisSpacing: 2,
                  mainAxisSpacing: 2),
            itemCount: col*row,
            itemBuilder: (context1, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(5),
                    ),
                    border: Border.all(color: Colors.black),
                    color: null
                    // ifBooking(allRooms[getRoomKey(lockerIndex,(index+1).toString())].id!)
                    //         ? Colors.green[300]
                    //         : null
                            ),

                height: lockerHeight,
                width:lockerWidth,
                child: GestureDetector(
                    onTap: () => showDialog(
                        context, 'the $lockerIndex locker and ${index+1} tab'),
                    child: Center(child: Text('${index+1}'))),
              );
            }),
      ),
    );
  }
}
