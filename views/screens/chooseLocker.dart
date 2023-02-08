import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/bookingProvider.dart';
import '../../controllers/lockerProvider.dart';
import '../../models/booking.dart';
import '../../models/locker.dart';
import '../../models/room.dart';
import '../widgets/appBar.dart';
import '../widgets/locker.dart';
import '../widgets/myIndicator.dart';
import 'bookingLocker.dart';

class ChooseLocker extends StatelessWidget {
  const ChooseLocker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lockerProvider = Provider.of<LockerProvider>(context);
    final bookingProvider = Provider.of<BookingProvider>(context);

    final List<LockerModel> lockers = lockerProvider.lockers;
    final LockerModel locker = lockerProvider.locker;
    final List<RoomModel> allRooms = lockerProvider.allRooms;
    final List<BookingModel> bookings = bookingProvider.bookings;
    // final List<String> bookingRoomsId=[];//=bookingProvider.bookingRoomsId;

    if (lockers.isEmpty) {
      lockerProvider.getLockersRequest();
      lockerProvider.getAllRoomsRequest();
      bookingProvider.getMayBookingRequest('1');
    }
//     if(!bookings.isEmpty)
//     {
//       for(int i=0;i<bookings.length;i++)
//       {
//         bookingRoomsId.add(bookings[i].roomId);
//           // notifyListeners();
//           // print(bookings[i].roomId);
//       }
//     }

//     if(!bookings.isEmpty&&(bookings.length==bookingRoomsId))
//     {
// print('bookingRoomsId');
// print(bookingRoomsId);
//     }
    // else{
    //   print(bookingRoomsId);
    // }

    double height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [
          const CustomeAppBar(
              icon: Icons.arrow_back_ios,
              title: 'Choose Locker',
              isHome: false),
          Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            height: height * 0.87,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/backGround.jpg'),
              fit: BoxFit.cover,
            )),
            child: !lockers.isEmpty && !allRooms.isEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 20),
                    itemCount: lockers.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: Material(
                              child: InkWell(
                                // child: CustomeLocker(lockerIndex: lockers[index].id!, col: lockers[index].col, row: lockers[index].row, lockerWidth: 25, lockerHeight: 30, allRooms: allRooms, bookings: bookings),
                                child: Locker(
                                    lockerIndex: lockers[index].id!,
                                    col: lockers[index].col,
                                    row: lockers[index].row,
                                    allRooms: allRooms,
                                    bookings: bookings),
                                onTap: () {
                                  // lockerProvider.getRequest(lockers[index].id!);
                                  lockerProvider
                                      .getLockerRequest(lockers[index].id!);
                                  lockerProvider.locker = new LockerModel(
                                      id: '',
                                      lockerId: '',
                                      buildId: '',
                                      invistorId: '',
                                      floorNumber: 0,
                                      row: 0,
                                      col: 0,
                                      roomPrice: 0,
                                      status: '');
                                  lockerProvider.rooms = [];
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BookingLocker(
                                          lockerIndex: lockers[index].id!)));
                                },
                              ),
                            ),
                          ),
                          Text(
                            '${lockers[index].buildId != '' ? lockers[index].buildId : 'Build 1'}, floor ${lockers[index].floorNumber}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    })
                : Center(
                    child: MyActivityIndicator(),
                  ),
          ),
        ],
      ),
    ));
  }
}
