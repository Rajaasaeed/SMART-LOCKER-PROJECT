import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../../controllers/bookingProvider.dart';
import '../../controllers/lockerProvider.dart';
import '../../models/booking.dart';
import '../../models/locker.dart';
import '../../models/room.dart';
import '../widgets/appBar.dart';
import '../widgets/button.dart';
import '../widgets/customeDateText.dart';
import '../widgets/customeShowDialog.dart';
import '../widgets/myIndicator.dart';
import '../widgets/oneLocker.dart';

class BookingLocker extends StatelessWidget {
  final String lockerIndex;
  BookingLocker({Key? key, required this.lockerIndex}) : super(key: key);

  static TextEditingController startDateController=new TextEditingController(text: DateTime.now().toString());
  static TextEditingController endDateController=new TextEditingController(text: DateTime.now().add(const Duration(days: 30)).toString());
  static TextEditingController sellectedIndexController=new TextEditingController(text: '');
   DateTime date=DateTime.now();

static const TextStyle styleText=TextStyle(
fontSize: 20,
);

  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final lockerProvider=Provider.of<LockerProvider>(context);
            final bookingProvider=Provider.of<BookingProvider>(context);

        final LockerModel locker=lockerProvider.locker;
        final List<RoomModel> rooms=lockerProvider.rooms;
        final List<RoomModel> allRooms=lockerProvider.allRooms;
         final List<BookingModel> bookings=bookingProvider.bookings;




      if(locker.id=='')
    {

      lockerProvider.getLockerRequest(lockerIndex);
      lockerProvider.getRoomsRequest(lockerIndex);
             bookingProvider.getMayBookingRequest('1');

    }else
    {

      print(locker.id);
    }

     if(rooms.isEmpty)
    {

      lockerProvider.getRoomsRequest(lockerIndex);
    }else
    {

      print(locker.id);
    }

    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [

         const CustomeAppBar(icon: Icons.arrow_back_ios,
           title: 'Booking Locker', 
           isHome: false),
           
          Expanded(
            child: Container(
          
              padding: const EdgeInsets.only( left: 20, right: 20,bottom: 0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/backGround.jpg'),
                fit: BoxFit.cover,
              )),
          
              child: SingleChildScrollView(
                child:locker.id!=''&&!rooms.isEmpty&&!bookings.isEmpty? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                     OneLocker(locker: locker,rooms:rooms,selectedIndex1: sellectedIndexController,ifSuccess: false,allRooms:allRooms,bookings:bookings,lockerIndex:locker.id!),

                     Text('Locker ID: ${locker.id}',style: styleText,),
                     Text('Location: Building ${locker.buildId}, Floor ${locker.floorNumber} , Locker ${locker.lockerId}',style: styleText,),
                    const Text('Student: Free',style: styleText,),
                    Text('Cost: ${locker.roomPrice} SAR',style: styleText,),

                   const  SizedBox(height: 10,),
                   
                        SizedBox(height: 10,),

                        CustomeDateText(
                          dateTitle: 'start Date:',
                         controller: startDateController),

           const  SizedBox(height: 10,),

                        CustomeDateText(dateTitle: 'End Date',
                         controller: endDateController),

                   const SizedBox(height: 30,),

                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        MyButton(backColor:const Color.fromARGB(255, 202, 176, 176), 
                        textColor: Colors.black, txt: 'PAYPAL', 
                        icn: Icons.credit_card,buttonWidth:150,
                        onPrs: ()=>CustomeDialog.customeShowDialog(context,'uuu',locker,rooms,sellectedIndexController.text,startDateController.text,endDateController.text),),
                         MyButton(backColor: const Color.fromARGB(255, 202, 176, 176), 

                        textColor: Colors.black,
                         txt: 'VISA',buttonWidth:150,
                         icn: Icons.credit_card,
                          onPrs: ()=>CustomeDialog.customeShowDialog(context,'uuu',locker,rooms,sellectedIndexController.text,startDateController.text,endDateController.text)),
                         MyButton(backColor: const Color.fromARGB(255, 202, 176, 176),
                        textColor: Colors.black, txt: 'APPLPAY', buttonWidth:150,
                        icn: Icons.credit_card, onPrs:()=>CustomeDialog.customeShowDialog(context,'uuu',locker,rooms,sellectedIndexController.text,startDateController.text,endDateController.text)),
                      ],
                    )
                  ],
                ):SizedBox(
                  height: height*0.50,
                  child: Center(
                    child: MyActivityIndicator(),
                    ),
                ),
              )
              
              
                 
            ),
          ),
        ],
      ),
    ));
  }
}
