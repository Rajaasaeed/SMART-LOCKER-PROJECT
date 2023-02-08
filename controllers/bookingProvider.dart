import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/booking.dart';

class BookingProvider with ChangeNotifier {
  late bool addBoogingLoade = false;
  late List<BookingModel> bookings=[];
  late List<String> bookingRoomsId=[];




  Future addBookingRequest(BookingModel bookingModel) async {
    addBoogingLoade = true;
    notifyListeners();

    var db = FirebaseFirestore.instance;

    try {
DocumentReference booking= await db.collection('booking').add(bookingModel.toMap());

final washingtonRef = await db.collection("lockers").doc(booking.id);
washingtonRef.update({"status": 'booking'}).then(
    (value) => print("DocumentSnapshot successfully updated!"),
    onError: (e) => print("Error updating document $e"));

print('add success');
    } catch (e) {
print(e);
    }
    addBoogingLoade = false;
    notifyListeners();
  }


//   Future getLockersRequest() async {
 

//     var db = FirebaseFirestore.instance;
//     try{
// var query=await db.collection('lockers').get();

// lockers=query.docs.map((doc) => LockerModel.fromJson(doc.data(),doc.id)).toList();

//     notifyListeners();

//     }catch(e)
//     {
//       print(e);
//     }

//   }

//    Future getLockerRequest(String id) async {

//     var db = FirebaseFirestore.instance;
//     try{
//  final docRef = db.collection("lockers").doc(id);
// await docRef.get().then(
//   (DocumentSnapshot doc) {
//     final data = doc.data() as Map<String,dynamic>;
//      locker = LockerModel.fromJson(data,doc.id);
//      var roomsCount=locker.row*locker.col;
//      print(roomsCount);


// notifyListeners();

//   },
//   onError: (e) => print("Error getting document: $e"),
// );



//     }catch(e)
//     {
//       print(e);
//     }

//   }


 Future getMayBookingRequest(String userId) async {
 
    var db = FirebaseFirestore.instance;
    try{
    db.collection("booking").where("userId", isEqualTo: userId).get().then(
      (res) {
      bookings=  res.docs.map((doc) =>BookingModel.fromJson(doc.data(),doc.id)).toList();
    notifyListeners();
      },
      onError: (e) => print("Error completing: $e"),
    );


   
        print(bookingRoomsId);
        
    }catch(e)
    {
      print(e);
    }
  }

//    Future getAllRoomsRequest() async {
 

//     var db = FirebaseFirestore.instance;
//     try{
// var query=await db.collection('rooms').get();

// allRooms=query.docs.map((doc) => RoomModel.fromJson(doc.data(),doc.id)).toList();

//     notifyListeners();

//     }catch(e)
//     {
//       print(e);
//     }

//   }


}
