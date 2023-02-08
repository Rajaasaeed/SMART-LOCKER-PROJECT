class BookingModel{
   late String? id;
  late String bookId;
  late String userId;
  late String roomId;
  late String lockerId;
  late int row;
  late int col;
  late String startDate;
  late String endDate;
  late int paidMony;
  late int remainingMony;
  late int violationMany;
  late String buildId;
  late int floor;
  late int roomPrice;
  late int status;

  BookingModel({
     this.id,
    required this.bookId,
    required this.userId,
    required this.roomId,
    required this.startDate,
    required this.endDate,
    required this.paidMony,
    required this.remainingMony,
    required this.violationMany, 
    required this.lockerId, 
    required this.row, 
    required this.col, 
    required this.buildId, 
    required this.floor, 
    required this.roomPrice, 
    required this.status
  });

  BookingModel.fromJson(Map<String,dynamic> json,String id)
  {
    bookId=json['bookId'];
    userId=json['userId'];
    roomId=json['roomId'];
    endDate=json['endDate'];
    startDate=json['startDate'];
    paidMony=json['paidMony'];
    remainingMony=json['remainingMony'];
    violationMany=json['violationMany'];
    lockerId=json['lockerId'];
    row=json['row'];
    buildId=json['buildId'];
    floor=json['floor'];
    col=json['col'];
    roomPrice=json['roomPrice'];
    status=json['status'];
    this.id=id;
  }

  Map<String,dynamic> toMap(){
    return {
      'bookId':bookId,
      'userId':userId,
      'roomId':roomId,
      'startDate':startDate,
      'endDate':endDate,
      'paidMony':paidMony,
      'remainingMony':remainingMony,
      'violationMany':violationMany,
      'lockerId':lockerId,
      'row':row,
      'col':col,
      'buildId':buildId,
      'floor':floor,
      'roomPrice':roomPrice,
      'status':status
    };
  }
}