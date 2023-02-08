
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
import '../widgets/customeDateText.dart';
import 'invoice.dart';


class PayWithVisa extends StatelessWidget {
          final LockerModel locker;
        final List<RoomModel> rooms;
        final String sellectedIndex;
        final String startDate;
        final String endDate;
  const PayWithVisa({Key? key, required this.locker, required this.rooms, required this.sellectedIndex, required this.startDate, required this.endDate}) : super(key: key);

static const TextStyle styleText=TextStyle(
fontSize: 20,
);

  int getRoomKey(){
  var key=rooms.indexWhere((element) => element.roomId==sellectedIndex);
  return key>=01?key:0;
}

static TextEditingController expiryDate=new TextEditingController(text: DateTime.now().toString());
 
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
        final bookingProvider=Provider.of<BookingProvider>(context);
        final lockerProvider=Provider.of<LockerProvider>(context);


    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [
         const CustomeAppBar(
          icon: Icons.arrow_back_ios,
           title: 'Pay with visa',
            isHome: false),
         
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20,bottom: 0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/backGround.jpg'),
                fit: BoxFit.cover,
              )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card Number'),
                    SizedBox(height: 7,),
                    SizedBox(
                      height: 40,
                      child: CupertinoTextField(
                        
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                    
                      ),
                    ),
                   
                  SizedBox(height: 20,),
                  
                    Text('The Name as it appears on the card'),
                    SizedBox(height: 7,),
                    SizedBox(
                      height: 40,
                      child: CupertinoTextField(
                        
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                    
                      ),
                    ),
                     SizedBox(height: 40,),
          
                     Row(
                      children: [
          
                        Column(
                          children: [
          Text('Expiry date'),
          SizedBox(height: 5,),
          SizedBox(
                      height: 40,
                      width: width*0.35,
                      child:     CustomeDateText(
                          dateTitle: '',
                         controller: expiryDate),

                      // CupertinoTextField(
                      //   placeholder: '   /',
                        
                      //   placeholderStyle: TextStyle(fontSize: 25),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white.withOpacity(0.3),
                      //   border: Border.all(color: Colors.grey, width: 1.0),
                      //   ),
                    
                      // ),
                    ),
                          ],
                        )
          
                        ,
                        SizedBox(width: width*0.1,),
                         Column(
                          children: [
                            Text('Verification code'),
          SizedBox(height: 5,),
          SizedBox(
                      height: 40,
                      width: width*0.35,
                      child: 
                      CupertinoTextField(
                        
                        placeholderStyle: TextStyle(fontSize: 25),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                    
                      ),
                    ),
                          ],
                        )
                      ],
                     ),
                      SizedBox(height: height*0.15,),
                    Center(
                      child: MyButtonWithoutIcon(
                        backColor:const Color.fromARGB(255, 202, 176, 176), 
                          textColor: Colors.black, txt: 'NEXT', 
                          onPrs: (){

                            BookingModel bookingModel=BookingModel(
                              bookId: '1',
                               userId: '1',
                                roomId: rooms[getRoomKey()].id!,
                                 startDate: startDate,
                                  endDate: endDate,
                                   paidMony: 0,
                                   remainingMony: 30, 
                                    violationMany: 22,
                                    lockerId:locker.id!,
                                    row: locker.row,
                                    col: locker.col,
                                    buildId: locker.buildId,
                                    roomPrice: locker.roomPrice,
                                    floor: locker.floorNumber,
                                    status:1
                                    
                                    );
                                    bookingProvider.addBookingRequest(bookingModel);
bookingProvider.bookings=[];
lockerProvider.allRooms=[];

                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Invoice(locker: locker, rooms: rooms,expiryDate:expiryDate.text,sellectedIndex1: sellectedIndex,)));
                          },
                          buttonWidth:200
                          ),
                    ),
              
                  ],
                ),
              )

                 
            ),
          ),
        ],
      ),
    ));
  }
}
