import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/invistorRequest.dart';
import '../models/locker.dart';
import '../models/room.dart';

class LockerProvider with ChangeNotifier {
  late bool addLoade = false;
  late List<LockerModel> lockers=[];
  late LockerModel  locker= LockerModel(id: '',lockerId: '', buildId: '', invistorId: '', floorNumber: 0, row: 0, col: 0, roomPrice: 0, status: '');
  late List<RoomModel> rooms=[];
  late List<RoomModel> allRooms=[];


  Future addLockerRequest(LockerModel lockerModel) async {
    addLoade = true;
    notifyListeners();

    InvistorRequestModel invistorRequestModel;

    var db = FirebaseFirestore.instance;

    try {
DocumentReference locker= await db.collection('lockers').add(lockerModel.toMap());

for(int i=0;i<lockerModel.row*lockerModel.col;i++)
{
RoomModel roomModel=RoomModel(id:'',lockerId:locker.id,roomId: i.toString(),status: 'empty',password: i.toString());
DocumentReference room= await  db.collection('rooms').add(roomModel.toMap());
}

InvistorRequestModel invistorRequestModel=InvistorRequestModel(
  invistorRequestId: '1234',
  invistorId: '1',
  requestType: 'add',
  status: 'notAccept',
  universityId: '1',
  lockerId: locker.id,
    );
DocumentReference req= await  db.collection('invistorRequest').add(invistorRequestModel.toMap());

print('add success');
    } catch (e) {
print(e);
    }
    addLoade = false;
    notifyListeners();
  }

  Future getLockersRequest() async {
 

    var db = FirebaseFirestore.instance;
    try{
var query=await db.collection('lockers').get();

lockers=query.docs.map((doc) => LockerModel.fromJson(doc.data(),doc.id)).toList();

    notifyListeners();

    }catch(e)
    {
      print(e);
    }

  }

   Future getLockerRequest(String id) async {
 
    var db = FirebaseFirestore.instance;
    try{
 final docRef = db.collection("lockers").doc(id);
await docRef.get().then(
  (DocumentSnapshot doc) {
    final data = doc.data() as Map<String,dynamic>;
     locker = LockerModel.fromJson(data,doc.id);
     var roomsCount=locker.row*locker.col;
     print(roomsCount);


notifyListeners();

  },
  onError: (e) => print("Error getting document: $e"),
);



    }catch(e)
    {
      print(e);
    }

  }


 Future getRoomsRequest(String id) async {
 

    var db = FirebaseFirestore.instance;
    try{
   db.collection("rooms").where("lockerId", isEqualTo: id).get().then(
      (res) {
      rooms=  res.docs.map((doc) =>RoomModel.fromJson(doc.data(),doc.id)).toList();
      notifyListeners();
      },
      onError: (e) => print("Error completing: $e"),
    );
    
    }catch(e)
    {
      print(e);
    }



  }

   Future getAllRoomsRequest() async {
 

    var db = FirebaseFirestore.instance;
    try{
      
var query=await db.collection('rooms').get();

allRooms=query.docs.map((doc) => RoomModel.fromJson(doc.data(),doc.id)).toList();

    notifyListeners();

    }catch(e)
    {
      print(e);
    }

  }


   Future deleteLockerRequest(String lockerId) async {
 

    var db = FirebaseFirestore.instance;
    try{

     await db.collection("lockers").doc(lockerId).delete().then(
      (doc) {

      },
      onError: (e) => print("Error updating document $e"),
    );

lockers=[];
allRooms=[];
notifyListeners();
getLockersRequest();
getAllRoomsRequest();

    // notifyListeners();

    }catch(e)
    {
      print(e);
    }

  }


}
