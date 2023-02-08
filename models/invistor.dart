class InvistorModel{
late String invistorId;
late String name;
late String userName;
late String passowrd;

InvistorModel({
  required this.invistorId,
  required this.name,
  required this.passowrd,
  required this.userName
});

InvistorModel.fromJson(Map<String,dynamic> json)
{
  invistorId=json['invistorId'];
  name=json['name'];
  passowrd=json['passowrd'];
  userName=json['userName'];
}

Map<String ,dynamic> toMap()
{
  return {
    'invistorId':invistorId,
    'name':name,
    'passowrd':passowrd,
    'userName':userName,

  };
}

}