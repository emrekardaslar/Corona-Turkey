import 'package:flutter/material.dart';
import 'package:corona/service.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool firstLoad=true;
  String s = '';
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
      totalTests: "",
      date: ""
    );

  Future runService() async {
    s = await exampleApi();
    final corona = coronaFromJson(s);
    //print("Date:  ${corona['19/03/2020'].date} Cases:  ${corona['19/03/2020'].cases}");
    coronaMap.clear();
    coronaMap = corona; 
    lastValue = coronaMap.values.last;
    
    setState(() { });
  }
  
  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      firstLoad = false;
      runService();
    }
    //runService();
    final formatter = new NumberFormat("###,###,###,###");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Turkey Coronavirus',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: 
      RefreshIndicator (
        child:  new ListView(
        children: <Widget>[
            new ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 50 ,0, 0),
            title: new Text('General: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            enabled: true,
          ),
            new ListTile(
              
            title: new Text("Total Tests: " + formatter.format(int.parse(lastValue.totalTests)), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            leading: Icon(Icons.assignment_turned_in),
            enabled: true,
          ),
            new ListTile(
            title: new Text("Total Cases: " + formatter.format(int.parse(lastValue.totalPatients)), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            leading: Icon(Icons.add),
            enabled: true,
          ),
            new ListTile(
            title: new Text("Total Deaths: " + formatter.format(int.parse(lastValue.totalDeaths)), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            leading: Icon(Icons.clear),
            enabled: true,
          ),
            new ListTile(
            title: new Text("Total Recovered: " + formatter.format(int.parse(lastValue.totalRecovered)), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            leading: Icon(Icons.accessibility_new),
            enabled: true,
          ),
            new ListTile(
            //contentPadding: const EdgeInsets.fromLTRB(20, 50 ,0, 0),
            title: new Text('Today: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            enabled: true,
          ),
          new ListTile(
            title: new Text("Tests: " + formatter.format(int.parse(lastValue.tests)), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            leading: Icon(Icons.assignment_turned_in),
            enabled: true,
          ),
          new ListTile(
            title: new Text("Cases: " + formatter.format(int.parse(lastValue.cases)), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            leading: Icon(Icons.add),
            enabled: true,
          ),
          new ListTile(
            title: new Text("Deaths: " + formatter.format(int.parse(lastValue.deaths)), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            leading: Icon(Icons.clear),
            enabled: true,
          ),
            new ListTile(
            title: new Text("Recovered: " + formatter.format(int.parse(lastValue.recovered)), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            leading: Icon(Icons.accessibility_new),
            enabled: true,
          ),
        ],
      ),
      //onRefresh: mapLocals,
      onRefresh: runService,
      )
    );
  }
} 