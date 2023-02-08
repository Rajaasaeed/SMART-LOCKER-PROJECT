class RoomModel{
 late String? id;
  late String roomId;
  late String lockerId;
  late String status;
  late String password;

  RoomModel({
    required this.roomId,
    required this.lockerId,
    required this.status,
    required this.password,
    this.id

  });
  RoomModel.fromJson(Map<String,dynamic> json,String id1)
  {
    roomId=json['roomId'];
    lockerId=json['lockerId'];
    status=json['status'];
    password=json['password'];
    id=id1;
  }
  Map<String,dynamic> toMap()
  {
    return {
      'roomId':roomId,
      'lockerId':lockerId,
      'status':status,
      'password':password,
    };
  }
}