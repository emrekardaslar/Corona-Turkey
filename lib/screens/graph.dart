import 'package:corona/covid_chart.dart';
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
  String dropdownValue = "Recovered";
  final List<Corona> data = [];
  Map<String,Corona> coronaMap = new Map<String,Corona>();
  CovidChart covidChart = new CovidChart(data: null);

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
    coronaMap.forEach((k, v) => data.add(
      Corona(
        date: v.date??"0.0",
        deaths: v.deaths??"0.0",
        cases: v.cases??"0.0",
        patients: v.patients??"0.0",
        tests: v.tests??"0.0",
        totalDeaths: v.totalDeaths??"0.0",
        recovered: v.recovered??"0.0",
        pneumoniaPercent: v.pneumoniaPercent??"0.0",
        totalIntensiveCare: v.totalIntensiveCare??"0.0",
        totalIntubated: v.totalIntubated??"0.0",
        totalPatients: v.totalPatients??"0.0",
        totalRecovered: v.totalPatients??"0.0",
        totalTests: v.totalTests??"0.0"
      )
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      firstLoad = false;
      fillList();
    }
    //String dropdownValue = "Recovered";
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
      body: Column(
        children: <Widget>[
          DropdownButton(
            value: dropdownValue,
            items: <String>['Recovered', 'Deaths', 'Cases', 'Patients', 'Tests']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
            }).toList(), 
            onChanged:(String newValue) {
              setState(() {
                dropdownValue = newValue;
                covidChart = new CovidChart(data: data, option: dropdownValue,);
              });
            }, 
          ),covidChart = new CovidChart(data: data, option: dropdownValue,)
        ],
      )
    );
  }
}