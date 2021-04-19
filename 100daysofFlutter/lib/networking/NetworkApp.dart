import 'dart:convert';

import 'package:flutter/material.dart';
import 'ApiResponseModel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  ApiResponseModel apiResponseModel;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Networking Example"),
        ),
        body: Container(child: Center(child: buildDataWidget())),
        floatingActionButton: FloatingActionButton(
          child: isLoading
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )
              : Icon(Icons.cloud),
          tooltip: "Get data from API",
          onPressed: () => getDataFromApi(),
        ));
  }

  buildDataWidget() {
    if (apiResponseModel == null)
      return Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Press the floating action button to get data",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      );
    else {
      return Text(
        "Total Cases : ${apiResponseModel.cases}\n"
        "Today's Cases : ${apiResponseModel.todayCases}\n"
        "Total Deaths : ${apiResponseModel.deaths}\n"
        "Today's Deaths : ${apiResponseModel.todayDeaths}\n"
        "Total Recovered : ${apiResponseModel.recovered}\n"
        "Active Cases : ${apiResponseModel.active}\n"
        "Critical Cases : ${apiResponseModel.critical}\n"
        "Cases per million: ${apiResponseModel.casesPerOneMillion}\n"
        "Total Tests Done: ${apiResponseModel.tests}\n"
        "Affected countires : ${apiResponseModel.affectedCountries}\n",
        style: TextStyle(fontSize: 18),
      );
    }
  }

  void getDataFromApi() async {
    setState(() {
      isLoading = true;
    });
    const String BASE_URL = "https://corona.lmao.ninja/v2/all";
    var response = await http.get(BASE_URL);
    var parsedJson = await json.decode(response.body);
    setState(() {
      apiResponseModel = ApiResponseModel.fromJson(parsedJson);
      isLoading = false;
    });
  }
}
