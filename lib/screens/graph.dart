import 'package:corona/covid_chart.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:corona/service.dart';

class GraphScreen extends StatefulWidget {
   const GraphScreen({Key key}) : super(key: key);
  @override
  _GraphScreenState createState() => _GraphScreenState();
}


class _GraphScreenState extends State<GraphScreen> {
  bool firstLoad=true;
  String s = '';
  List<double> patientList = new List<double>();
  List<double> totalCases = new List<double>();
  List<double> deathList = new List<double>();
  List<String> dateList = new List<String>();
  List<String> labelY = new List<String>();
  final List<Corona> data = [];
  Map<String,Corona> coronaMap = new Map<String,Corona>();
  Corona lastValue = new Corona(
      patients: "",
      totalPatients: "",
      deaths: "",
      totalDeaths: "",
      recovered: "",
      totalRecovered: "",
      totalIntubated: "",
      totalIntensiveCare: "",
      tests: "",
      cases: "",
      totalTests: "",
      date: ""
    );

  Future runService() async {
    s = await exampleApi();
    final corona = coronaFromJson(s);
    coronaMap.clear();
    coronaMap = corona; 
    if (this.mounted)
      setState(() { });
  }

  Future fillList() async {
    await runService();  
    coronaMap.forEach((k, v) => patientList.add(double.tryParse(v.patients)!=null?double.tryParse(v.patients):0.0));
    coronaMap.forEach((k, v) => deathList.add(double.tryParse(v.deaths)!=null?double.tryParse(v.deaths):0.0));
    coronaMap.forEach((k, v) => totalCases.add(double.tryParse(v.totalPatients)!=null?double.tryParse(v.totalPatients):0.0));
    coronaMap.forEach((k, v) => data.add(
      Corona(
        date: v.date,
        deaths: v.deaths
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      firstLoad = false;
      fillList();

    }

/*
    final List<Corona> data = [
      Corona(
        cases: "2000",
        date: "01/05/2020"
      ),

      Corona(
        cases: "2500",
        date: "02/05/2020"
      ),
    ];*/

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Turkey Coronavirus',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      body: Center(
        child: CovidChart(
          data: data,
        ),
      )
    );
  }
}