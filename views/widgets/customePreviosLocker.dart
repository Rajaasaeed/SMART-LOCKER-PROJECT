import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../models/booking.dart';
import '../../models/room.dart';
import 'customeLocker.dart';

class CustomePreviosLocker extends StatelessWidget {
  final BookingModel bookingModel;
      final List<RoomModel> allRooms;
      final List<BookingModel> bookings;

  const CustomePreviosLocker({Key? key, required this.bookingModel, required this.allRooms, required this.bookings}) : super(key: key);
  static TextEditingController selectedController=new TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
   CustomeLocker(lockerIndex: bookingModel.lockerId,
                   col: bookingModel.row, 
                   row: bookingModel.col, 
                   lockerWidth: 30.0,
                    lockerHeight: 30.0,
                    allRooms:allRooms,
                    bookings:bookings,
                    // selectedController: selectedController,
                    onPrs: (){},
                  
                    ),

                    Text('ID: ${bookingModel.lockerId.substring(0,5)}'),
                    Text('DATE: ${bookingModel.startDate.substring(0,10)}'),
                    Text('PRICE: ${bookingModel.roomPrice} SAR'),
                    Text('LOC: locker : 5,\n${bookingModel.buildId},floor ${bookingModel.floor}'),
               
    ],
  );
  }
}