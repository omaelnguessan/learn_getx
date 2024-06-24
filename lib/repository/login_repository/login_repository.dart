import 'dart:async';

import 'package:learn_getx/data/network/network_api_services.dart';
import 'package:learn_getx/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    print(AppUrl.loginApi);
    dynamic response = _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}