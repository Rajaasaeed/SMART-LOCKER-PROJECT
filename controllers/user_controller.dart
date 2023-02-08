import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/complaint_model.dart';
import '../models/user_model.dart';
import '../views/widgets/cryptor copy.dart';

class UserController extends ChangeNotifier {
  final users = FirebaseFirestore.instance.collection('users');
  var logined;
  var passwordChanged;
  var checkEmail;
  var subscribed;
  var commentForInvestor;
  var commentForUniversity;
  late bool isLoadeSin = false;
  late String userType;
  var updated;
 late String userId;
  late String firstS;
  late String lastS;
  late String usernameS;
  late String phoneS;



  Future userSignUp({required UserModel userModel}) async {
    print(userModel.toJson());
    try {
      isLoadeSin = true;
      notifyListeners();

      final username =
          await users.where('username', isEqualTo: userModel.username).get();
      final email =
          await users.where('email', isEqualTo: userModel.email).get();
      if (username.docs.isNotEmpty) {
        subscribed = 1;
        isLoadeSin = false;
        notifyListeners();
      }
      if (email.docs.isNotEmpty) {
        subscribed = 2;
        isLoadeSin = false;
        notifyListeners();
      }
      if (username.docs.isEmpty && email.docs.isEmpty) {
        DocumentReference user = await FirebaseFirestore.instance
            .collection('users')
            .add(userModel.toJson());
        print(user.id);
        print(user);
        subscribed = 0;
        isLoadeSin = false;
        notifyListeners();
      }
    } catch (err) {
      subscribed = -1;
      notifyListeners();
    }
  }

  Future userSignIn(
      {required String username, required String password}) async {
    isLoadeSin = true;
    notifyListeners();

    password = Cryptor().passwordEncryption(password);
    try {
          final store = await SharedPreferences.getInstance();

      var query = await users
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();
      if (query.docs.isNotEmpty) {
        logined = true;

        userType = query.docs[0]['type_user'];
         store.setString("id", query.docs[0].id);
        store.setString("first_name", query.docs[0]['first_name']);
        store.setString("last_name", query.docs[0]['last_name']);
        store.setString("username", query.docs[0]['username']);
        store.setString("phone", query.docs[0]['phone']);
        await saveUserInfo();

        isLoadeSin = false;
        notifyListeners();
      } else {
        logined = false;
        isLoadeSin = false;
        notifyListeners();
      }
    } catch (error) {
      logined = false;
      isLoadeSin = false;
      notifyListeners();
    }
  }
 Future saveUserInfo() async {
    final store = await SharedPreferences.getInstance();
    userId= store.getString("id") ?? "no";
    firstS = store.getString("first_name") ?? "first_name";
    lastS = store.getString("last_name") ?? "last_name";
    usernameS = store.getString("username") ?? "username";
    phoneS = store.getString("phone") ?? "0000000000";
    notifyListeners();
  }
  Future changePassword({required String password}) async {
    notifyListeners();

    try {
      await users.doc(userId).update({'password': password});
      passwordChanged = true;
      notifyListeners();
    } catch (error) {
      passwordChanged = false;
      notifyListeners();
    }
  }

  Future updataInfo(
      {required String firstName,
      required String lastName,
      required String username,
      required String phone}) async {
    isLoadeSin = true;
    notifyListeners();

    final store = await SharedPreferences.getInstance();
    String uId = store.getString('user_id') ?? "";
    try {
      await users.doc(userId).update({
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "username": username
      });
      isLoadeSin = false;
      updated = true;
      notifyListeners();
    } catch (err) {
      updated = false;
      isLoadeSin = false;
      notifyListeners();
    }
  }

  Future forgatPassword({required String email}) async {
    try {
      final query = await users.where('email', isEqualTo: email).get();
      if (query.docs.isNotEmpty) {
        checkEmail = true;
        notifyListeners();
      } else {
        checkEmail = false;
        notifyListeners();
      }
    } catch (error) {
      checkEmail = false;
      notifyListeners();
    }
  }

  writeCommentForInvestor({required ComplaintModel complaintModel}) async {
    print(complaintModel.complaintNum);
    try {
      DocumentReference complaint = await FirebaseFirestore.instance
          .collection('complaints')
          .add(complaintModel.jsonForInvestor());
      print(complaint.id);
      commentForInvestor = true;
      notifyListeners();
    } catch (err) {
      commentForInvestor = false;
      notifyListeners();
    }
  }

  writeCommentForUniversity({required ComplaintModel complaintModel}) async {
    print(complaintModel.complaintNum);
    try {
      DocumentReference complaint = await FirebaseFirestore.instance
          .collection('complaints')
          .add(complaintModel.jsonForUniversity());
      print(complaint.id);
      commentForUniversity = true;
      notifyListeners();
    } catch (err) {
      commentForUniversity = false;
      notifyListeners();
    }
  }

  tt() async {
    var o;
    final x = await FirebaseFirestore.instance.collection('coll').get();
    x.docs.map((e) async {
      print(e.id);
      print(e.data());
      o = await FirebaseFirestore.instance
          .collection('stss')
          // .doc(e.id)
          .get();
      print(o.docs);
    }).toList();
    // .then((value) {
    //   value.docs.map((e) async {
    //     print(e);
    //     return await FirebaseFirestore.instance
    //         .collection('stss')
    //         .doc(e.id)
    //         .get()
    //         .then((value) {
    //       print(value.data());
    //       return value.data();
    //     });

    // print(c);
    // });
    // });
    // print(x);
    // return x;
    // print(x.docs.length);
    // print(x.docs[1]);
    // List<Future<Map<String, dynamic>?>> y = x.docs.map((doc) async {
    //   var c =
    //       await FirebaseFirestore.instance.collection('stss').doc(doc.id).get();
    //   // print(c);
    //   return c.data();
    // }).toList();
    // return y;
  }
}


// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:smart/data/user_data_source.dart';
// import 'package:smart/models/complaint_model.dart';

// import '../cryptor.dart';
// import '../models/user_model.dart';
// import '../screens/investor_home_page.dart';

// class UserController extends ChangeNotifier {
//   var logined;
//   final user = UserData();
//   final random = Random();
//   var messageUniversity;
//   var messageInvestor;
//   var subscribed;
//   // var logined;
//   var usernameNotFound;

//   signIn({required String username, required String password}) async {
//     username = username.trim();
//     password = Cryptor().passwordEncryption(password);

//     // final
//     logined = await user.userSignIn(username: username, password: password);
//     notifyListeners();
//     // if (logined) {
//     //   return true;
//     // } else {
//     //   return "password or username error";
//     // }
//   }

//   signUp() {
//     logined = 1;
//     notifyListeners();
//   }

//   forgatPassword() {}
//   changePassword() {}
//   writeCommentForUniversity(String message) async {
//     String studentId = "dgfhg";
//     String studentName = "dvcb";
//     int complaintNum = random.nextInt(100000);
//     messageUniversity = await user.writeCommentForUniversity(
//         complaintModel: ComplaintModel(
//             complaintNum: complaintNum,
//             studentId: studentId,
//             studentName: studentName,
//             message: message));
//     notifyListeners();

//     // print(messageUniversity);
//   }

//   writeCommentForInvestor(
//       {required String message, required String type}) async {
//     // get

//     String investorId = "cvx";
//     String studentId = "dgfhg";
//     String studentName = "dvcb";
//     int complaintNum = random.nextInt(100000);

//     messageInvestor = await user.writeCommentForInvestor(
//         complaintModel: ComplaintModel(
//             investorId: investorId,
//             complaintNum: complaintNum,
//             studentId: studentId,
//             studentName: studentName,
//             message: message,
//             type: type));
//     notifyListeners();

//     print(messageInvestor);
//   }

//   getComplaints() async {
//     final complaints = await user.getCom();
//     if (!complaints.isNotEmpty) {
//       print(complaints);
//       return complaints;
//     } else
//       return "Dont found  complaints";
//   }
// }

// class Bu extends StatelessWidget {
//   const Bu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   login(
//       {required BuildContext context,
//       required String username,
//       required String password}) async {
//     username = username.trim();
//     password = Cryptor().passwordEncryption(password.trim());

//     final logined =
//         await UserData().userSignIn(username: username, password: password);
//     if (logined) {
//       // ignore: use_build_context_synchronously
//       Navigator.push(context,
//           CupertinoPageRoute(builder: (context) => const InvestorHomePage()));
//     } else {
//       showCupertinoModalPopup(
//           context: context,
//           builder: (BuildContext context) => CupertinoActionSheet(
//                 title: Text("app pop"),
//                 message: Text("message"),
//                 actions: <CupertinoActionSheetAction>[
//                   CupertinoActionSheetAction(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text("do something")),
//                   CupertinoActionSheetAction(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text("do two")),
//                 ],
//               ));
//     }
//   }

//   // signUp({required BuildContext context}) async {
//   // signUp({required BuildContext context, required UserModel userModel}) async {
//   //   var subscribed = await UserData().signUp(userModel: userModel);
//   //   if (subscribed == 0) {
//   //     print("sec");
//   //   } else if (subscribed == 1) {
//   //     print("username fo");
//   //   } else if (subscribed == 2) {
//   //     print("email fo");
//   //   } else {
//   //     print("error fo");
//   //   }
//   // }

//   test(BuildContext context) {
//     Provider.of<UserController>(context).signUp();
//     return Consumer<UserController>(builder: ((context, value, child) {
//       if (value.logined == 0) {
//         return Text("sec");
//       } else if (value.logined == 1) {
//         return Text("username fo");
//       } else if (value.logined == 2) {
//         return Text("email fo");
//       } else {
//         return Text("error fo");
//       }
//     }));
//   }
// }
