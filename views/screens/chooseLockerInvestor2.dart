
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/bookingProvider.dart';
import '../../controllers/lockerProvider.dart';
import '../../models/booking.dart';
import '../../models/locker.dart';
import '../../models/room.dart';
import '../widgets/appBar.dart';
import '../widgets/buttonWithoutIcon.dart';
import '../widgets/customeLocker.dart';
import '../widgets/myIndicator.dart';
import 'addLocker.dart';
import 'previousRequest.dart';

class ChooseLockerInvestor2 extends StatefulWidget {
  ChooseLockerInvestor2({Key? key}) : super(key: key);

  static const TextStyle styleText = TextStyle(
    fontSize: 20,
  );

  late TextEditingController selectedController =
      new TextEditingController(text: '');

  @override
  State<ChooseLockerInvestor2> createState() => _ChooseLockerInvestor2State();
}

class _ChooseLockerInvestor2State extends State<ChooseLockerInvestor2> {
  void clickAdd(context) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => AddLOckerScreen()));
  }
  void clickPreviose(context) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => PreviousRequest()));
  }

  int getRoomKey(String lokerId, String roomId, List<RoomModel> allRooms) {
    var key = allRooms.indexWhere(
        (element) => element.lockerId == lokerId && element.roomId == roomId);
    return key >= 01 ? key : 0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final lockerProvider = Provider.of<LockerProvider>(context);
    final bookingProvider = Provider.of<BookingProvider>(context);

    final List<LockerModel> lockers = lockerProvider.lockers;
    final LockerModel locker = lockerProvider.locker;
    final List<RoomModel> allRooms = lockerProvider.allRooms;
    final List<BookingModel> bookings = bookingProvider.bookings;

    if (lockers.isEmpty) {
      lockerProvider.getLockersRequest();
      lockerProvider.getAllRoomsRequest();
      bookingProvider.getMayBookingRequest('1');
    }

    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [
          const CustomeAppBar(
              icon: Icons.arrow_back_ios,
              title: 'Choose locker',
              isHome: false),
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 0),
                // height: height * 0.87,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/backGround.jpg'),
                  fit: BoxFit.cover,
                )),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03, right: width * 0.03, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Choose the locker :',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            MyButtonWithoutIcon(
                                backColor: Color.fromARGB(255, 223, 187, 187),
                                textColor: Colors.black,
                                buttonWidth: 150,
                                txt: 'PREVIOUS',
                                onPrs: () =>clickPreviose(context)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.50,
                        child: !lockers.isEmpty && !allRooms.isEmpty
                            ? GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 0),
                                itemCount: lockers.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      //                     Material(
                                      //       child: InkWell(
                                      //       child: Locker(lockerIndex: lockers[index].id!,col: lockers[index].col,row: lockers[index].row,allRooms:allRooms),
                                      //       onTap: (){
                                      //         // lockerProvider.getRequest(lockers[index].id!);
                                      //         lockerProvider.getLockerRequest(lockers[index].id!);
                                      //           lockerProvider.locker=new LockerModel(id: '',lockerId: '', buildId: '', invistorId: '', floorNumber: 0, row: 0, col: 0, roomPrice: 0, status: '');
                                      //  lockerProvider.rooms=[];
                                      //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookingLocker(lockerIndex: lockers[index].id!)));
                                      //       },
                                      //     ),
                                      //     ),
                                      Material(
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.selectedController.text =
                                                  locker.id!;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color:
                                                      widget.selectedController
                                                                  .text ==
                                                              lockers[index].id!
                                                          ? Color.fromARGB(
                                                              255, 255, 230, 0)
                                                          : Colors.white,
                                                  width: 2.0),
                                            ),
                                            child: CustomeLocker(
                                              lockerIndex: lockers[index].id!,
                                              col: lockers[index].col,
                                              row: lockers[index].row,
                                              lockerWidth: 25,
                                              lockerHeight: 30,
                                              allRooms: allRooms,
                                              bookings: bookings,
                                              onPrs: () {
                                                setState(() {
                                                  widget.selectedController
                                                          .text =
                                                      widget.selectedController
                                                                  .text ==
                                                              lockers[index].id!
                                                          ? ''
                                                          : lockers[index].id!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${lockers[index].buildId}, Floor ${lockers[index].floorNumber}',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  );
                                })
                            : Center(
                                child: MyActivityIndicator(),
                              ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 15),
                        // width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyButtonWithoutIcon(
                                backColor: Color.fromARGB(255, 223, 187, 187),
                                textColor: Colors.black,
                                buttonWidth: 150,
                                txt: 'ADD',
                                onPrs: () => clickAdd(context)),
                            MyButtonWithoutIcon(
                                backColor: Color.fromARGB(255, 223, 187, 187),
                                textColor: Colors.black,
                                buttonWidth: 150,
                                txt: 'TRANSFER',
                                onPrs: () {}),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 10),
                        // width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyButtonWithoutIcon(
                                backColor: Color.fromARGB(255, 223, 187, 187),
                                textColor: Colors.black,
                                buttonWidth: 150,
                                txt: 'DELETE',
                                onPrs: () {
                                  if (widget.selectedController.text != '') {
                                    lockerProvider.deleteLockerRequest(
                                        widget.selectedController.text);
                                  }
                                }),
                            MyButtonWithoutIcon(
                                backColor: Color.fromARGB(255, 223, 187, 187),
                                textColor: Colors.black,
                                buttonWidth: 150,
                                txt: 'KEEP',
                                onPrs: () {}),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: width * 0.99,
                        child: CupertinoTextField(
                          style: TextStyle(color: Colors.black),
                          placeholderStyle: TextStyle(color: Colors.black),
                          textDirection: TextDirection.ltr,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          placeholder: 'Write Comment..',
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            border: Border.all(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: MyButtonWithoutIcon(
                            backColor: const Color.fromARGB(255, 202, 176, 176),
                            textColor: Colors.black,
                            txt: 'NEXT',
                            onPrs: () {},
                            buttonWidth: 350),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
