
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/lockerProvider.dart';
import '../../models/booking.dart';
import '../../models/locker.dart';
import '../../models/room.dart';
import '../screens/bookingLocker.dart';

class Locker extends StatelessWidget {
  final String lockerIndex;
  final int col;
  final int row;
  final List<RoomModel> allRooms;
  final List<BookingModel> bookings;

  const Locker(
      {Key? key,
      required this.lockerIndex,
      required this.col,
      required this.row, required this.allRooms, required this.bookings})
      : super(key: key);

  void toLocker(context, lockerIndex,lockerProvider) {
   lockerProvider.locker= LockerModel(id: '',lockerId: '', buildId: '', invistorId: '', floorNumber: 0, row: 0, col: 0, roomPrice: 0, status: '');
     lockerProvider.getLockerRequest(lockerIndex);
     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookingLocker(lockerIndex: lockerIndex)));
    // showCupertinoDialog(
    //     context: context,
    //     builder: (context) {
    //       return CupertinoAlertDialog(
    //         title: Text('Locker Info'),
    //         content: Text(
    //           txt,
    //           style: TextStyle(fontSize: 30),
    //         ),
    //         actions: <CupertinoDialogAction>[
    //           CupertinoDialogAction(
    //             child: Text('close'),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             isDestructiveAction: true,
    //           )
    //         ],
    //       );
    //     });
  }

  int getRoomKey(String lokerId,String roomId){
  var key=allRooms.indexWhere((element) => element.lockerId==lokerId&&element.roomId==roomId);
  return key>=01?key:0;
}


bool ifBooking(String roomKey)
{
 var isFound=bookings.indexWhere((element) => element.roomId==roomKey);
 if(isFound!=-1)
 return true;
 else
 return false;
}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
        
final lockerProvider=Provider.of<LockerProvider>(context);

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        padding: EdgeInsets.all(2),
        // height:30*row+row*2,
        // width: 25*col+col*2,
        color: Colors.white,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: col >= row ? col : row,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2),
            itemCount: col * row,
            itemBuilder: (context1, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(5),
                    ),
                    border: Border.all(color: Colors.black),
                    color: ifBooking(allRooms[getRoomKey(lockerIndex,(index+1).toString())].id!)
                        ? Colors.green[300]
                        : allRooms[getRoomKey(lockerIndex,index.toString())].status == "booking"
                            ? Colors.red
                            : null),

                // height: width * 0.012,
                // width: width * 0.012,
                child: GestureDetector(
                    onTap: () => toLocker(
                        context,lockerIndex ,lockerProvider),
                    child: Center(
                        child: Text(
                      '${index + 1}',
                      style:
                          TextStyle(fontSize: col >= row ? 70 / col : 70 / row),
                    ))
                    ),
              );
            }),
      ),
    );
  }
}
