import 'package:cloud_firestore/cloud_firestore.dart';

class LockerModel{
  late String? id;
  late String lockerId;
  late String buildId;
  late String invistorId;
  late int floorNumber;
  late int row;
  late int col;
  late int roomPrice;
  late String status;
 
  LockerModel({
   required this.lockerId,
  required this.buildId,
  required this.invistorId,
  required this.floorNumber,
  required this.row,
  required this.col,
  required this.roomPrice,
  required this.status,
  this.id


  });

  LockerModel.fromJson(Map<String,dynamic> json,String id1)
  {
    lockerId=json['lockerId'];
    buildId=json['buildId'];
    invistorId=json['invistorId'];
    floorNumber=json['floorNumber'];
    row=json['row'];
    col=json['col'];
    roomPrice=json['roomPrice'];
    status=json['status'];
    id=id1;
  }

  Map<String,dynamic> toMap()
  {
    return {
      'lockerId':lockerId,
      'buildId':buildId,
      'invistorId':invistorId,
      'floorNumber':floorNumber,
      'col':col,
      'row':row,
      'roomPrice':roomPrice,
      'status':status,

    };
  }
  
}