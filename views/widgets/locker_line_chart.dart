import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../controllers/investor_controller.dart';
import '../../controllers/university_controller.dart';
import '../../models/statistic_locker_model.dart';
import '../screens/statisics_page.dart';
import 'item_complaint_widget.dart';

class LockerLineChart extends StatelessWidget {
  const LockerLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    bool isInvestor = true;
    if (isInvestor) {
      var data = Provider.of<InvestorController>(context);
      data.getStatisticLockers();
      return Consumer<InvestorController>(builder: ((context, value, child) {
        if (value.statisticLockersInvestor.isNotEmpty) {
          return Column(
              children: [
                Container(
                    height: 400,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    margin: const EdgeInsets.only(
                      right: 10,
                      top: 50,
                    ),
                    child: LineChart(
                        swapAnimationCurve: Curves.linear,
                        swapAnimationDuration:
                            const Duration(milliseconds: 150),
                        statisticLockersCahart(value.statisticLockersInvestor))),
              ]);
        } else {
          return const LoadingWidget();
        }
      }));
    } else {
      var data = Provider.of<UniversityController>(context);
      data.getStatisticLockers();
      // if (data.statisticLockersEmpty == true) {
      //   return Container(
      //       margin: const EdgeInsets.only(top: 100),
      //       child: const LoadingWidget());
      // }

      // if (data.statisticLockers.length > 0) {
        return Consumer<UniversityController>(builder: ((context, value, child) {
          if (value.statisticLockers.isNotEmpty) {
            return Column(
              children: [
                Container(
                    height: 400,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    margin: const EdgeInsets.only(
                      right: 10,
                      top: 50,
                    ),
                    child: LineChart(
                        swapAnimationCurve: Curves.linear,
                        swapAnimationDuration:
                            const Duration(milliseconds: 150),
                        statisticLockersCahart(value.statisticLockers))),
                const SizedBox(height: 20),
                const SendStatiscsToInvestor(id:"nnnnn")
              ],
            );
          } else {
            return LoadingWidget();
          }
        }));
    }
  }

  Container emptyStatisticLockers() {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Empty locker statistic",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  LineChartData statisticLockersCahart(List<StatisticLockersModel> data) {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: data
              .map((point) =>
                  FlSpot(point.building.toDouble(), point.total.toDouble()))
              .toList(),
          isCurved: false,
          dotData: FlDotData(show: false),
          barWidth: 4,
        ),
      ],
      maxX: 10,
      minX: 0,
      minY: 0,
      maxY: 10,
      borderData: FlBorderData(
          border: const Border(
        bottom: BorderSide(),
        left: BorderSide(),
      )),
      gridData: FlGridData(drawVerticalLine: false),
      titlesData: FlTitlesData(
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: ((value, meta) {
                  String text = '';
                  switch (value.toInt()) {
                    // case 1:text = "A";break;
                    case 1:
                      text = "A";
                      break;
                    case 2:
                      text = "B";
                      break;
                    case 3:
                      text = "C";
                      break;
                    case 4:
                      text = "D";
                      break;
                    case 5:
                      text = "E";
                      break;
                    case 6:
                      text = "F";
                      break;
                    case 7:
                      text = "G";
                      break;
                    case 8:
                      text = "H";
                      break;
                    case 9:
                      text = "I";
                      break;
                    case 10:
                      text = "J";
                      break;
                    case 11:
                      text = "K";
                      break;
                    case 12:
                      text = "L";
                      break;
                    case 20:
                      text = "T";
                      break;
                    case 21:
                      text = "U";
                      break;
                    case 22:
                      text = "V";
                      break;
                    case 23:
                      text = "W";
                      break;
                    case 24:
                      text = "X";
                      break;
                    case 25:
                      text = "Y";
                      break;
                    case 26:
                      text = "Z";
                      break;
                  }
                  return Text(text);
                })),
            axisNameWidget: const Text("Locker",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            axisNameSize: 40),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: ((value, meta) {
                String text = '';
                switch (value.toInt()) {
                  case 10:
                    text = "10";
                    break;
                  case 20:
                    text = "20";
                    break;
                  case 30:
                    text = "30";
                    break;
                  case 40:
                    text = "40";
                    break;
                  case 50:
                    text = "50";
                    break;
                  case 60:
                    text = "60";
                    break;
                  case 70:
                    text = "70";
                    break;
                  case 80:
                    text = "80";
                    break;
                  case 90:
                    text = "90";
                    break;
                  case 100:
                    text = "99";
                    break;
                }
                return Text(text);
              })),
          axisNameWidget: const Text("Users",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          axisNameSize: 40,
        ),
      ),
    );
  }
}
