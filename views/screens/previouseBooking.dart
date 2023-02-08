import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/bookingProvider.dart';
import '../../controllers/lockerProvider.dart';
import '../../models/booking.dart';
import '../../models/room.dart';
import '../widgets/appBar.dart';
import '../widgets/customePreviosLocker.dart';
import '../widgets/myIndicator.dart';

class PreviousBooking extends StatelessWidget {
  const PreviousBooking({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final bookingProvider=Provider.of<BookingProvider>(context);
     final lockerProvider=Provider.of<LockerProvider>(context);

   final List<BookingModel> bookings=bookingProvider.bookings;
      

    final List<RoomModel> allRooms=lockerProvider.allRooms;

    if(bookings.isEmpty)
    {

      bookingProvider.getMayBookingRequest('1');
      lockerProvider.getAllRoomsRequest();
    }

    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [
         const CustomeAppBar(
            icon: Icons.arrow_back_ios,
             title: 'Previous Booking',
             isHome: false),
     
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: height * 0.87,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/backGround.jpg'),
              fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(
              child:!bookings.isEmpty&&!allRooms.isEmpty? Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 20.0,
                    runSpacing: 10.0,
children:  [
  for(int i=0;i<bookings.length;i++)
  CustomePreviosLocker(bookingModel: bookings[i],allRooms:allRooms,bookings:bookings)

],
                  ),
                
                 
                ],
              ):Center(
                  child: MyActivityIndicator(),
                  
            ),)
          ),
        ],
      ),
    ));
  }
}
