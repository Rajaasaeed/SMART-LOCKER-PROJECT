class ComplaintModel {
  final String studentId;
  final String complaintId;
  final int complaintNum;
  final String studentName;
  final String message;
  final String type;
  final String reply;
  final String investorId;

  ComplaintModel(
      {this.complaintId = "",
      this.type = "",
      this.investorId = "",
      required this.complaintNum,
      required this.studentId,
      required this.studentName,
      required this.message,
      this.reply = ""});

  factory ComplaintModel.fromJsonInvestor(
      Map<String, dynamic> json, String id) {
    return ComplaintModel(
        investorId: json['investor_id'],
        complaintId: id,
        complaintNum: json['complaint_num'],
        studentId: json["student_id"],
        studentName: json["student_name"],
        message: json["message"],
        type: "type",
        reply: json["reply"]);
  }
  factory ComplaintModel.fromJsonUniversity(Map<String, dynamic> json) {
    return ComplaintModel(
        complaintNum: json['complaint_num'],
        complaintId: json['complaint_id'],
        studentId: json["student_id"],
        studentName: json["student_name"],
        message: json["message"],
        reply: json["reply"]);
  }
  factory ComplaintModel.json(Map<String, dynamic> json) {
    return ComplaintModel(
        complaintNum: 0,
        complaintId:"8",
        studentId: json["student_id"],
        studentName: json["student_name"],
        message: json["message"],
        reply: json["reply"]??"");
  }

  Map<String, dynamic> jsonForInvestor() {
    return {
      'investor_id': investorId,
      'complaint_id': complaintId,
      "student_id": studentId,
      "student_name": studentName,
      "message": message,
      "reply": reply,
    };
  }

  Map<String, dynamic> jsonForUniversity() {
    return {
      'complaint_id': complaintId,
      "student_id": studentId,
      "student_name": studentName,
      "message": message,
      "reply": reply,
    };
  }
}
