import 'dart:convert';

import 'package:day2/networking/ApiResponseModel.dart';
import 'package:day2/networking/model/NetworkResponse.dart';
import 'package:http/http.dart' as http;
import 'package:day2/networking/Constants.dart';

class NetworkRepo {
  Future<NetworkResponse> getLatestDataFromApi() async {
    try {
      var response = await http.get(Uri.parse(API_END_POINT_URL));
      var parsedJson = await json.decode(response.body);
      ApiResponseModel apiResponseModel = ApiResponseModel.fromJson(parsedJson);
      return NetworkResponseData(apiResponseModel);
    } catch (exception) {
      return NetworkException(exception.toString());
    }
  }
}
