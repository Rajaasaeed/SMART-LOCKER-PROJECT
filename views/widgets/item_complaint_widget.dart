import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../controllers/investor_controller.dart';
import '../../controllers/university_controller.dart';

class ItemComplaintsWidget extends StatelessWidget {
  const ItemComplaintsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInvestor = true;
    if (isInvestor) {
      Provider.of<InvestorController>(context).getComplaints();
      return Consumer<InvestorController>(builder: ((context, value, child) {
        
        if (value.complaintsInvestor.isEmpty) {
          return LoadingWidget();
        } else {
        print('value.complaintsInvestor');
        print(value.complaintsInvestor);
          return ListViewItemComplaintWidget(
              complaints: value.complaintsInvestor);
       }
      }
      ));
    } else {
      Provider.of<UniversityController>(context).getComplaints();
      return Consumer<UniversityController>(builder: ((context, value, child) {
        if (value.complaintsEmpty == true) {
          return Text("Complaints is Empty ");
        }
        if (value.complaintsUniversity.isEmpty) {
          return LoadingWidget();
        } else {
          return ListViewItemComplaintWidget(
              complaints: value.complaintsUniversity);
        }
      }));
    }
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: 100,
        width: 100,
        child: const CupertinoActivityIndicator(radius: 50),
      ),
    );
  }
}

class ListViewItemComplaintWidget extends StatelessWidget {
  final List complaints;
  const ListViewItemComplaintWidget({
    Key? key,
    required this.complaints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: complaints.length,
        itemBuilder: ((context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        complaints[index].complaintId.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 68, 67, 67)),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(CupertinoIcons.person_alt_circle_fill,
                              color: Color.fromARGB(255, 3, 156, 72),
                              size: 30)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("${complaints[index].studentName}:",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 3, 156, 72))),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                                // "i can booking a free locker and i have enough money in my card",
                                complaints[index].message,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 68, 67, 67))),
                            const SizedBox(height: 15),
                            Text(
                                // "You choose the loker but suddenly you got offkine",
                                complaints[index].reply,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 3, 156, 72))),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
