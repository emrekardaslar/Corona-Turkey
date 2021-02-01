import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> exampleApi() async {
  http.Response response = await http.get(
    Uri.encodeFull('https://raw.githubusercontent.com/ozanerturk/covid19-turkey-api/master/dataset/timeline.json'),
  );
 // print("Respone ${response.body.toString()}");

  return response.body;
}
//https://raw.githubusercontent.com/ozanerturk/covid19-turkey-api/master/dataset/timeline.json

Map<String, Corona> coronaFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Corona>(k, Corona.fromJson(v)));
String coronaToJson(Map<String, Corona> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Corona {
    String patients='';
    String totalPatients='';
    String deaths='';
    String totalDeaths='';
    String recovered='';
    String totalRecovered='';
    String totalIntubated='';
    String totalIntensiveCare='';
    String tests='';
    String cases = '';
    String totalTests='';
    String date='';
    String pneumoniaPercent = '';

    Corona({
        this.patients,
        this.totalPatients,
        this.deaths,
        this.totalDeaths,
        this.recovered,
        this.totalRecovered,
        this.totalIntubated,
        this.totalIntensiveCare,
        this.tests,
        this.cases,
        this.totalTests,
        this.date,
        this.pneumoniaPercent
    });

    factory Corona.fromJson(Map<String, dynamic> json) => Corona(
        patients: json["patients"],
        totalPatients: json["totalPatients"],
        deaths: json["deaths"],
        totalDeaths: json["totalDeaths"],
        recovered: json["recovered"],
        totalRecovered: json["totalRecovered"],
        totalIntubated: json["totalIntubated"],
        totalIntensiveCare: json["totalIntensiveCare"],
        tests: json["tests"],
        cases: json["cases"],
        totalTests: json["totalTests"],
        date: json["date"],
        pneumoniaPercent: json["pneumoniaPercent"]
    );

    Map<String, dynamic> toJson() => {
        "patients": patients,
        "totalCases": totalPatients,
        "deaths": deaths,
        "totalDeaths": totalDeaths,
        "recovered": recovered,
        "totalRecovered": totalRecovered,
        "totalIntubated": totalIntubated,
        "totalIntensiveCare": totalIntensiveCare,
        "tests": tests,
        "cases": cases,
        "totalTests": totalTests,
        "date": date,
        "pneumoniaPercent": pneumoniaPercent
    };
}