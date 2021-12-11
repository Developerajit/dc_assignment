import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) => PieChart(
    PieChartData(
      
      borderData: FlBorderData(show: false),
      sectionsSpace: 5,
      centerSpaceRadius: 50,
      sections: getSections(touchedIndex),
    ),
    swapAnimationCurve: Curves.bounceIn,
    swapAnimationDuration: Duration(seconds: 5),
  );
}




List<PieChartSectionData> getSections(int? touchedIndex) => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
    

      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        showTitle: false,
        radius: 15,      
      );

      return MapEntry(index, value);
    })
    .values
    .toList();



class PieData {
  static List<Data> data = [
    Data(name: 'Orange', percent: 30, color: Colors.orange),
    Data(name: 'Grey', percent: 10, color: Colors.grey),
    Data(name: 'DeepOrange', percent: 22, color: Colors.deepOrange),
  ];
}

class Data {
  final String? name;

  final double?percent;

  final Color? color;

  Data({this.name, this.percent, this.color});
}