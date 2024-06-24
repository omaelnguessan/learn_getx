import 'dart:async';

import 'package:learn_getx/data/network/network_api_services.dart';
import 'package:learn_getx/res/app_url/app_url.dart';
import 'package:learn_getx/models/home/user_list_model.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userList);
    return UserListModel.fromJson(response);
  }
}