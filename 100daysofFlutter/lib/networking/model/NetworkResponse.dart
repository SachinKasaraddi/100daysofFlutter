import 'package:day2/networking/ApiResponseModel.dart';

class NetworkResponse {}

class NetworkException extends NetworkResponse {
  String message;

  NetworkException(this.message);
}

class NetworkResponseData extends NetworkResponse {
  ApiResponseModel apiResponseModel;

  NetworkResponseData(this.apiResponseModel);
}
