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
    String cases='';
    String totalCases='';
    String deaths='';
    String totalDeaths='';
    String recovered='';
    String totalRecovered='';
    String totalIntubated='';
    String totalIntensiveCare='';
    String tests='';
    String totalTests='';
    String date='';

    Corona({
        this.cases,
        this.totalCases,
        this.deaths,
        this.totalDeaths,
        this.recovered,
        this.totalRecovered,
        this.totalIntubated,
        this.totalIntensiveCare,
        this.tests,
        this.totalTests,
        this.date,
    });

    factory Corona.fromJson(Map<String, dynamic> json) => Corona(
        cases: json["cases"],
        totalCases: json["totalCases"],
        deaths: json["deaths"],
        totalDeaths: json["totalDeaths"],
        recovered: json["recovered"],
        totalRecovered: json["totalRecovered"],
        totalIntubated: json["totalIntubated"],
        totalIntensiveCare: json["totalIntensiveCare"],
        tests: json["tests"],
        totalTests: json["totalTests"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "cases": cases,
        "totalCases": totalCases,
        "deaths": deaths,
        "totalDeaths": totalDeaths,
        "recovered": recovered,
        "totalRecovered": totalRecovered,
        "totalIntubated": totalIntubated,
        "totalIntensiveCare": totalIntensiveCare,
        "tests": tests,
        "totalTests": totalTests,
        "date": date,
    };
}
