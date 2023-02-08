import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/complaint_model.dart';
import '../models/statistic_locker_model.dart';

class UniversityController extends ChangeNotifier {
  List<ComplaintModel> complaintsUniversity = [];
  List<StatisticLockersModel> statisticLockers = [];
  var statisticVisible;
  var statisticLockersEmpty;
  var complaintsEmpty;

  Future getComplaints() async {
    try {
      var query = await FirebaseFirestore.instance
          .collection('complaints')
          .get();
      if (query.docs.isNotEmpty) {
        print(query.docs[0].data());
        // print(query.docs[1].data());
        // print(query.docs[2].data());
        complaintsUniversity = query.docs
            .map((doc) => ComplaintModel.fromJsonUniversity(doc.data()))
            .toList();
        notifyListeners();
      } else {
        // complaintsEmpty = true;
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future getStatisticLockers() async {
    try {
      var query = await FirebaseFirestore.instance
          .collection('locker_statistic')
          .orderBy('building')
          .get();
      if (query.docs.isNotEmpty) {
        statisticLockers = query.docs
            .map((doc) => StatisticLockersModel.fromJson(doc.data(), doc.id))
            .toList();
        notifyListeners();
      } else {
        statisticLockersEmpty = true;
        notifyListeners();
      }
    } catch (error) {
      // print(error.toString());
    }
  }

  Future sendStatisticLockersToInvestor(String uId) async {
    try {
      await FirebaseFirestore.instance
          .collection('locker_statistic')
          .doc(uId)
          .update({'visible': true});
      statisticVisible = true;
      notifyListeners();
    } catch (error) {
      statisticVisible = false;
      notifyListeners();
    }
  }
}
