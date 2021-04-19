import 'package:day2/networking/ApiResponseModel.dart';
import 'package:day2/networking/NetworkScreenViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class NetworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NetworkScreenViewModel>.withConsumer(
      viewModel: NetworkScreenViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar(),
              body: buildBody(viewModel),
              floatingActionButton: buildFloatingActionButton(viewModel),
            ),
          ),
        );
      // ignore: missing_return
      },
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text("Networking App"),
    );
  }

  buildBody(NetworkScreenViewModel viewModel) {
    return Container(
      child: Center(
        child: buildDataWidget(viewModel),
      ),
    );
  }

  buildFloatingActionButton(NetworkScreenViewModel viewModel) {
    return FloatingActionButton(
        child: viewModel.isLoading
            ? CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : Icon(Icons.cloud),
        tooltip: "Get data from API",
        onPressed: () => viewModel.getDataFromApi());
  }

  buildDataWidget(NetworkScreenViewModel viewModel) {
    ApiResponseModel apiResponseModel = viewModel.apiResponseModel;

    if (apiResponseModel == null)
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "${viewModel.messaToShow}",
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
}
