import 'package:corona/service.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CovidChart extends StatelessWidget {
  final List<Corona> data;
  final String option;
  CovidChart({@required this.data, this.option});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Corona,String>> series = [
      charts.Series(
        id: "Covid",
        data: data,
        domainFn: (Corona series, _) => series.date,
        measureFn: (Corona series, _) => double.tryParse(series.recovered),
      )
    ];

    if (option == "Deaths") {
      series = [
      charts.Series(
        id: "Covid",
        data: data,
        domainFn: (Corona series, _) => series.date,
        measureFn: (Corona series, _) => double.tryParse(series.deaths),
      )
    ];
    }

    if (option == "Recovered") {
      series = [
      charts.Series(
        id: "Covid",
        data: data,
        domainFn: (Corona series, _) => series.date,
        measureFn: (Corona series, _) => double.tryParse(series.recovered),
      )];
    }

    if (option == "Tests") {
      series = [
      charts.Series(
        id: "Covid",
        data: data,
        domainFn: (Corona series, _) => series.date,
        measureFn: (Corona series, _) => double.tryParse(series.tests),
      )];
    }

   if (option == "Cases") {
      series = [
      charts.Series(
        id: "Covid",
        data: data,
        domainFn: (Corona series, _) => series.date,
        measureFn: (Corona series, _) => double.tryParse(series.cases),
      )];
    }

    if (option == "Patients") {
      series = [
      charts.Series(
        id: "Covid",
        data: data,
        domainFn: (Corona series, _) => series.date,
        measureFn: (Corona series, _) => double.tryParse(series.patients),
      )];
    }
    
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Container(      
        child: Column(
          children: <Widget>[
            Expanded(
              child: charts.BarChart(series, animate: true)
            ),
          ],
        ),
      ),
    );
  }
}