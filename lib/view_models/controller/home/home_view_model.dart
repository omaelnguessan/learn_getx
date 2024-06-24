import 'package:get/get.dart';

import 'package:learn_getx/repository/home_repository/home_repository.dart';
import 'package:learn_getx/utils/utils.dart';
import 'package:learn_getx/data/response/status.dart';
import 'package:learn_getx/models/home/user_list_model.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      Utils.snackBar('error'.tr, error.toString());
    });
  }

  void userListRefreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      Utils.snackBar('error'.tr, error.toString());
    });
  }
}