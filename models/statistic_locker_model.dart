class StatisticLockersModel {
  final String name;
  final String id;
  final int total;
  final int building;

  StatisticLockersModel({ this.id="", required this.name, required this.total, required this.building});

   factory StatisticLockersModel.fromJson(Map<String, dynamic> json,String uid) {
    return StatisticLockersModel(
        name: json['name'],
        total: json['total'],
        building: json["building"],
        id:uid
        );
  }
}
