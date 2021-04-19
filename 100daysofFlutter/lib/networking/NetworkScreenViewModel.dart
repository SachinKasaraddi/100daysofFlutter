import 'package:day2/networking/ApiResponseModel.dart';
import 'package:day2/networking/model/NetworkResponse.dart';
import 'package:day2/networking/repository/NetworkScreenRepository.dart';
import 'package:flutter/cupertino.dart';

class NetworkScreenViewModel extends ChangeNotifier {
  NetworkScreenViewModel() {
    getDataFromApi();
  }

  ApiResponseModel apiResponseModel;
  String messaToShow = "";
  bool isLoading = false;

  void getDataFromApi() async {
    isLoading = true;
    notifyListeners();
    NetworkResponse networkResponse =
        await NetworkScreenRepository().getLatestStatsData();
    if (networkResponse is NetworkResponseData) {
      apiResponseModel = networkResponse.apiResponseModel;
    } else if (networkResponse is NetworkException) {
      messaToShow = networkResponse.message;
    }
    isLoading = false;
    notifyListeners();
  }
}
