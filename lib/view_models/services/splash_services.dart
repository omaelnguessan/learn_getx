import 'package:get/get.dart';
import 'dart:async';

import 'package:learn_getx/res/routes/routes_name.dart';
import 'package:learn_getx/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {

  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      String routesName;
      if(value.isLogin == true) {
        routesName = RoutesName.homeView;
      } else {
        routesName = RoutesName.loginView;
      }
      Timer(const Duration(seconds: 3), () => Get.toNamed(routesName));
    });
  }
}
