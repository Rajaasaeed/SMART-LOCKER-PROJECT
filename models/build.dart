class BuildModel{
  late String buildId;
  late String name;
  late String universityId;
  BuildModel({
    required this.name,
    required this.buildId,
    required this.universityId,

  });

  BuildModel.fromJson(Map<String,dynamic> json)
  {
    name=json['name'];
    buildId=json['buildId'];
    universityId=json['universityId'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'buildId':buildId,
      'universityId':universityId,

    };
  }
  
}