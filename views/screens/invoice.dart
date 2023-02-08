import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../controllers/bookingProvider.dart';
import '../../controllers/lockerProvider.dart';
import '../../models/booking.dart';
import '../../models/locker.dart';
import '../../models/room.dart';
import '../widgets/oneLocker.dart';

class Invoice extends StatelessWidget {
          final LockerModel locker;
        final List<RoomModel> rooms;
        final String expiryDate;
        final String sellectedIndex1;
        
   Invoice({Key? key, required this.locker, required this.rooms, required this.expiryDate, required this.sellectedIndex1}) : super(key: key);

  static const TextStyle styleText = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 122, 21, 14)
      );

  late TextEditingController sellectedIndexController=new TextEditingController(text: sellectedIndex1);

  int getRoomKey(){
  var key=rooms.indexWhere((element) => element.roomId==sellectedIndex1);
  return key>=01?key:0;
}
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

   final bookingProvider=Provider.of<BookingProvider>(context);
    final lockerProvider=Provider.of<LockerProvider>(context);

    final List<RoomModel> allRooms=lockerProvider.allRooms;
    final List<BookingModel> bookings=bookingProvider.bookings;

    if(bookings.isEmpty||allRooms.isEmpty)
    {

      lockerProvider.getAllRoomsRequest();
       bookingProvider.getMayBookingRequest('1');

    }

    return CupertinoPageScaffold(
        child: Container(
            padding: EdgeInsets.only(
                top: height * 0.03, left: 20, right: 20, bottom: 0),
            height: height,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/backGround.jpg'),
              fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(

              child: SafeArea(
                child:  !bookingProvider.addBoogingLoade?Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   const  Icon(
                      Icons.check_circle,
                      size: 50,
                      color: Colors.green,
                    ),
                  const  SizedBox(
                      height: 2,
                    ),

                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      height: height * 0.1,
                      width: width * 0.80,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child:const Text(
                        'Payment completed successfully andd booking',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold
                            ),
                      ),
                    ),
                  const  SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Location : ${locker.buildId},Floor ${locker.floorNumber} ,Locker ${locker.lockerId}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 185, 61, 52),
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                          ),
                    ),
                     OneLocker(locker:locker,rooms: rooms,selectedIndex1: sellectedIndexController,ifSuccess: true,allRooms: allRooms,bookings: bookings,lockerIndex:locker.id!),

                     Text(
                      expiryDate,
                      style: styleText,
                    ),
                    
                    const Text(
                      'at (4:00 pm - 5:30 pm)',
                      style: styleText,
                    ),
                    const Text(
                      'Payment by: VISA',
                      style: styleText,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                     Text(
                      'PASSWORD: ${rooms[getRoomKey()].password}${expiryDate.substring(0,4)}',
                      style: styleText,
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                  const  Positioned(
                        bottom: 0,
                        child: Text(
                            '- Note: The booking activity ends at the specified time as shown and any delay will be calculated\nas a delay fee (the houre is 20 SAR)'))
                  ],
                ):Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                        child: CupertinoActivityIndicator(
                        animating: true,
                        radius: 20,
                        color: Colors.black,)),
                ),
              ),
            )));
  }
}
