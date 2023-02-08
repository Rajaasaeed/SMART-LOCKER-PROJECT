import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/booking.dart';
import '../../models/locker.dart';
import '../../models/room.dart';


class OneLocker extends StatefulWidget {
  final LockerModel locker;
  final List<RoomModel> rooms;
  final TextEditingController selectedIndex1;
    final bool ifSuccess;
    final List<BookingModel> bookings;
    final List<RoomModel> allRooms;
    final String lockerIndex;

  const OneLocker({Key? key, required this.locker, required this.rooms,required this.selectedIndex1, required this.ifSuccess, required this.bookings, required this.allRooms, required this.lockerIndex}) : super(key: key);

  @override
  State<OneLocker> createState() => _OneLockerState();
}

class _OneLockerState extends State<OneLocker> {


  void showDialog(context, txt) {
    setState(() {
      clickColor=clickColor==Colors.red?Colors.white:Colors.red;
    });
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

//   int getRoomKey(String roomId){
//   var key=widget.rooms.indexWhere((element) => element.roomId==roomId);
//   return key>=01?key:0;
// }

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

late Color clickColor=Colors.white;
late String selectedIndex=widget.selectedIndex1.text;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tobPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double height = MediaQuery.of(context).size.height;

  //   final lockerProvider=Provider.of<LockerProvider>(context);
  //           final List<RoomModel> roomss=lockerProvider.rooms;


  // if(locker.id=='')
  //   {

  //     lockerProvider.getLockerRequest(locker.id!);

  //   }else
  //   {

  //     print(locker.id);
  //   }
  
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Container(
        // alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: width * 0.15,vertical: 10),
        padding: EdgeInsets.all(5),
        height: width * 0.60,
        width: width * 0.60,
        
        color: Colors.white.withOpacity(0.4),
        child: GridView.builder(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:  widget.locker.col >= widget.locker.row ? widget.locker.col : widget.locker.row, 
                crossAxisSpacing: 4, 
                mainAxisSpacing: 4,
                ),
            itemCount: widget.locker.row*widget.locker.col,
            itemBuilder: (context1, index) {
              return Container(
                
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.black),
                    color:ifBooking(widget.allRooms[getRoomKey(widget.lockerIndex,(index+1).toString())].id!)
                            ? Colors.green[300]:
                            widget.locker.id==widget.rooms[0].lockerId&& widget.allRooms[getRoomKey(widget.lockerIndex,(index).toString())].status == "booking"
                        ? Colors.red
                            : selectedIndex==widget.allRooms[getRoomKey(widget.lockerIndex,(index+1).toString())].id?Colors.green:null),

                height: width * 0.054,
                width: width * 0.054,
                child: GestureDetector(
                    onTap: ()  {
                     if(!widget.ifSuccess)
                     {
                       setState(() {
                        if(selectedIndex==widget.allRooms[getRoomKey(widget.lockerIndex,(index+1).toString())].id!)
                        {
                      selectedIndex='';
                      widget.selectedIndex1.text='';
                        }else
                        selectedIndex=widget.allRooms[getRoomKey(widget.lockerIndex,(index+1).toString())].id!;
                        widget.selectedIndex1.text=widget.allRooms[getRoomKey(widget.lockerIndex,(index+1).toString())].id!;
                      });
                     }
                      // showDialog(
                      //   context, 'the ${widget.locker.id} locker and $index tab');
                        
                        },
                    child: Center(child: Text('${index+1}',style: TextStyle(
                      fontSize: widget.locker.col >= widget.locker.row ? 70 / widget.locker.col : 70 / widget.locker.row
                    ),))),
              );
            }),
      ),
    );
  }
}
