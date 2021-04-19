import 'package:day2/networking/model/NetworkResponse.dart';
import 'package:day2/networking/repository/NetworkRepo.dart';

class NetworkScreenRepository {
  Future<NetworkResponse> getLatestStatsData() {
    return NetworkRepo().getLatestDataFromApi();
  }
}
