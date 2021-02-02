import 'package:corona/service.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CovidChart extends StatelessWidget {
  
  final List<Corona> data;

  CovidChart({@required this.data});

  @override
  Widget build(BuildContext context) {

    List<charts.Series<Corona,String>> series = [
      charts.Series(
        id: "Covid",
        data: data,
        domainFn: (Corona series, _) => series.date,
        measureFn: (Corona series, _) => double.tryParse(series.deaths),
      )
    ];


    return charts.BarChart(series, animate: true,);
  }
}