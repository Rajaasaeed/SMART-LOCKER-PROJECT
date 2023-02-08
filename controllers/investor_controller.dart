import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';


import '../models/complaint_model.dart';
import '../models/statistic_locker_model.dart';

class InvestorController extends ChangeNotifier {
  List<ComplaintModel> complaintsInvestor = [];
  List<StatisticLockersModel> statisticLockersInvestor = [];

  Future<void> getComplaints() async {
    try {
      var query = await FirebaseFirestore.instance
          .collection('complaints_investor2')
          // .where('investor_id', isEqualTo: investorId)
          .get();
      complaintsInvestor = query.docs
          .map((doc) => ComplaintModel.fromJsonInvestor(doc.data(), doc.id))
          .toList();
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> getStatisticLockers() async {
    try {
      var query = await FirebaseFirestore.instance
          .collection('locker_statistic')
          .orderBy('building')
          .get();
      if (query.docs.isNotEmpty) {
        statisticLockersInvestor = query.docs
            .map((doc) => StatisticLockersModel.fromJson(doc.data(), doc.id))
            .toList();
        notifyListeners();
      } else {
        // statisticLockersEmpty = true;
        // notifyListeners();
      }
    } catch (error) {
      // print(error.toString());
    }
  }
}
