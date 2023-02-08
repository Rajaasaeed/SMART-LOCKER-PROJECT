import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/booking.dart';
import '../../models/room.dart';


class CustomeLocker extends StatefulWidget {
  final String lockerIndex;
  final int col;
  final int row;
  final double lockerWidth;
  final double lockerHeight;
  final List<RoomModel> allRooms;
  final List<BookingModel> bookings;
  // final TextEditingController selectedController;
    final Function onPrs;

  
  const CustomeLocker({Key? key, required this.lockerIndex, required this.col, required this.row, required this.lockerWidth, required this.lockerHeight, required this.allRooms, required this.bookings, required this.onPrs}) : super(key: key);

  @override
  State<CustomeLocker> createState() => _CustomeLockerState();
}

class _CustomeLockerState extends State<CustomeLocker> {
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
  var key=widget.allRooms.indexWhere((element) => element.lockerId==lokerId&&element.roomId==roomId);
  return key>=01?key:0;
}

bool ifBooking(String roomKey)
{
 var isFound=widget.bookings.indexWhere((element) => element.roomId==roomKey);
 if(isFound!=-1)
 return true;
 else
 return false;
}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tobPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double height = MediaQuery.of(context).size.height;

    // if(widget.selectedController.text==widget.lockerIndex)
    // {
    //   print(widget.lockerIndex);
    // }

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
                              // border:Border.all(
                              //   color: widget.selectedController.text==widget.lockerIndex?Color.fromARGB(255, 255, 230, 0):Colors.white, 
                              //   width: 2.0),
                            ),
        padding: EdgeInsets.all(2),
        height:widget.lockerWidth*widget.row+widget.row*2,
        width: widget.lockerWidth*widget.col+widget.col*2,
        
        child: GridView.builder(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.col,
                 crossAxisSpacing: 2,
                  mainAxisSpacing: 2),
            itemCount: widget.col*widget.row,
            itemBuilder: (context1, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(5),
                    ),
                    border: Border.all(color: Colors.black),
                    color: ifBooking(widget.allRooms[getRoomKey(widget.lockerIndex,(index+1).toString())].id!)
                            ? Colors.green[300]
                            : widget.allRooms[getRoomKey(widget.lockerIndex,index.toString())].status == "booking"
                            ? Colors.red
                            : null),

                height: widget.lockerHeight,
                width:widget.lockerWidth,
                child: GestureDetector(
                    onTap: () =>widget.onPrs(),
                    // {
                    //   setState(() {
                    //     widget.selectedController.text='';
                    //     widget.selectedController.text=widget.selectedController.text==widget.lockerIndex?'':widget.lockerIndex;

                    //   });
                    //   // print(widget.selectedController.text);
                    //   // showDialog(
                      
                    //   //   context, 'the $lockerIndex locker and ${index+1} tab');
                    //   },
                    child: Center(child: Text('${index+1}'))),
              );
            }),
      ),
    );
  }
}
