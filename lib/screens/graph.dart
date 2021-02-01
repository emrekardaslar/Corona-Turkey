import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:corona/service.dart';
import 'package:draw_graph/draw_graph.dart';

class GraphScreen extends StatefulWidget {
   const GraphScreen({Key key}) : super(key: key);
  @override
  _GraphScreenState createState() => _GraphScreenState();
}


class _GraphScreenState extends State<GraphScreen> {
  bool firstLoad=true;
  String s = '';
  List<double> caseList = new List<double>();
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
    //print("Date:  ${corona['19/03/2020'].date} Cases:  ${corona['19/03/2020'].cases}");
    coronaMap.clear();
    coronaMap = corona; 
    print(coronaMap);
    coronaMap.forEach((k, v) => caseList.add(double.parse(v.cases)));
    
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      firstLoad = false;
      //runService();
      //print(caseList);
    }
    //runService();
    final List<Feature> features = [
    Feature(
      title: "Cases",
      color: Colors.blue,
      data: [1,2,3,5],
    ),
    Feature(
      title: "Deaths",
      color: Colors.pink,
      data: [1,2,3]
    ),
    
  ];
    
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
      /*body: LineGraph(
          features: features,
          size: Size(320, 300),
          labelX: ['Day 1', 'Day 2'],
          labelY: ['20%', '40%'],
          showDescription: true,
          graphColor: Colors.white30,
        ),*/
    );
  }
}