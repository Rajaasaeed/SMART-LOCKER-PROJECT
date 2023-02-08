import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/bookingProvider.dart';
import '../../controllers/lockerProvider.dart';
import '../../models/locker.dart';
import '../../models/room.dart';
import '../widgets/customeLockerRequest.dart';

class PreviousRequest extends StatelessWidget {
  const PreviousRequest({Key? key}) : super(key: key);

  static const TextStyle styleText =
      TextStyle(fontSize: 19, color: Color.fromARGB(255, 107, 100, 100));

  static void customeShowDialog(context, txt) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Confurm payment'),
            content: Text(
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
                onPressed: () {},
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


    final lockerProvider=Provider.of<LockerProvider>(context);
        final bookingProvider=Provider.of<BookingProvider>(context);


    final List<LockerModel> lockers=lockerProvider.lockers;
    // final LockerModel locker=lockerProvider.locker;
    final List<RoomModel> allRooms=lockerProvider.allRooms;
    // final List<BookingModel> bookings=bookingProvider.bookings;
    // final List<String> bookingRoomsId=[];//=bookingProvider.bookingRoomsId;
    


    if(lockers.isEmpty)
    {

      lockerProvider.getLockersRequest();
      lockerProvider.getAllRoomsRequest();
       bookingProvider.getMayBookingRequest('1');

    }

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
                      'Previous Request',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
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
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Color.fromARGB(255, 255, 230, 0), width: 2.0),
                            ),
                            margin: EdgeInsets.only(top: 50),
                            padding: EdgeInsets.all(15),
                            child: CustomeLockerRequest(
                                lockerIndex: 22.toString(),
                                col: 5,
                                row: 5,
                                lockerWidth: 50,
                                lockerHeight: 50,
                                allRooms:  allRooms,
                       
                                ),
                          ),
                        ),
                        Text(
                          'A',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Locker : A',
                      style: styleText,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Request: Add more locker',
                      style: styleText,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Status request : is done',
                      style: styleText,
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
