// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/bookingProvider.dart';
import '../../controllers/lockerProvider.dart';
import '../widgets/IconText.dart';
import '../widgets/appBar.dart';
import '../widgets/richTextProfile.dart';
import 'chooseLocker.dart';
import 'commentFor.dart';
import 'previouseBooking.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
       final bookingProvider=Provider.of<BookingProvider>(context);
     final lockerProvider=Provider.of<LockerProvider>(context);

  //  final List<BookingModel> bookings=bookingProvider.bookings;
      
  //   // final LockerModel locker=lockerProvider.locker;
  //   final List<RoomModel> allRooms=lockerProvider.allRooms;

  //  if(!bookings.isEmpty || !allRooms.isEmpty)
  //   {

      // bookingProvider.bookings=[];
      // lockerProvider.allRooms=[];
  //   }

    return CupertinoPageScaffold(
        child: Container(
      color: Colors.white,
      child: Column(
        children: [
          const CustomeAppBar(icon: Icons.person, title: 'Home', isHome: true),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: height * 0.18,
            child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/logo2.jpg')),
          ),
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
                child: Column(
                  children: [
                    Material(
                      color: Colors.white.withOpacity(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChooseLocker()));
                        },
                        child: const IconText(
                          txt: 'BOOK LOCKER',
                          icn: CupertinoIcons.lock,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Material(
                      color: Colors.white.withOpacity(0),
                      child: InkWell(
                        onTap: () {
        bookingProvider.bookings=[];
        lockerProvider.allRooms=[];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PreviousBooking()));
                        },
                        child: const IconText(
                          txt: 'PREVIOUS BOOKING',
                          icn: CupertinoIcons.time,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Material(
                      color: Colors.white.withOpacity(0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CommentFor()));
                        },
                        child: const IconText(
                          txt: 'COMMENT',
                          icn: CupertinoIcons.captions_bubble,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
                padding: const EdgeInsets.all(10),
                height: height * 0.17,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MyRichText(
                        firstText: 'booklocker ',
                        secondText: '- Locker reservation'),
                    MyRichText(
                        firstText: 'provious booking  ',
                        secondText: '- Locker reservation'),
                    MyRichText(
                        firstText: 'comment ',
                        secondText: '- Locker reservation'),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.yellow, width: 2.0),
                  color: const Color.fromARGB(94, 255, 255, 254),
                ),
              )
            ]),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: height * 0.62,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage('assets/images/backGround.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.wb_incandescent_outlined,
                    color: Colors.red,
                  ),
                ),
                Text(
                  ' NEED TO HELP?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
