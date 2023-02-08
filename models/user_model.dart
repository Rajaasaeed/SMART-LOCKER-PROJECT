class UserModel {
  late final String fristName;
  late final String lastName;
  late final String username;
  late final String email;
  late final String phone;
  late final String password;
  late final String typeUser;

  UserModel(
      {required this.fristName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phone,
      required this.password,
      required this.typeUser});

  UserModel.fromJson(Map<String,dynamic> json)
  {
    fristName=json['fristName'];
    lastName=json['lastName'];
    username=json['username'];
    email=json['email'];
    phone=json['phone'];
    password=json['password'];
    typeUser=json['typeUser'];
  }


  Map<String, dynamic> toJson() {
    return {
      'first_name': fristName,
      'last_name': lastName,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'type_user': typeUser,
    };
  }

 
  

}
