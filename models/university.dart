class UniversityModel {
  late String universityId;
  late String name;

  UniversityModel(
      {required this.name,
      required this.universityId,
      });

  UniversityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    universityId = json['universityId'];

  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'universityId': universityId};
  }
}
