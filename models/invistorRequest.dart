class InvistorRequestModel{
  late String invistorRequestId;
  late String invistorId;
  late String requestType;
  late String status;
  late String universityId;
  late String lockerId;

  InvistorRequestModel({
    required this.invistorRequestId,
    required this.invistorId,
    required this.requestType,
    required this.status,
    required this.universityId,
    required this.lockerId
  });

  InvistorRequestModel.fromJson(Map<String,dynamic> json)
  {
    invistorRequestId=json['invistorRequestId'];
    invistorId=json['invistorId'];
    requestType=json['requestType'];
    status=json['status'];
    universityId=json['universityId'];
    lockerId=json['lockerId'];
  }

  Map<String,dynamic> toMap(){
    return {
      'invistorRequestId':invistorRequestId,
      'invistorId':invistorId,
      'requestType':requestType,
      'status':status,
      'universityId':universityId,
      'lockerId':lockerId,
    };
  }
}