import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learn_getx/repository/login_repository/login_repository.dart';
import 'package:learn_getx/utils/utils.dart';
import 'package:learn_getx/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:learn_getx/models/login/user_model.dart';
import 'package:learn_getx/res/routes/routes_name.dart';

class LoginViewModel extends GetxController {

  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map<String, dynamic> data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if(value['error'] != null) {
        Utils.snackBar('error'.tr, value['error']);
      } else {
        Utils.snackBar('login'.tr, 'login_success'.tr);
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true
        );
        userPreference.saveUser(userModel).then((value) {
          Get.toNamed(RoutesName.homeView)!.then((value) {});
        }).onError((error, stackTrace) {
          Utils.snackBar('error'.tr, error.toString());
        });
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('error'.tr, error.toString());
    });
  }


}