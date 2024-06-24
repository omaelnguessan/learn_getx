import 'package:get/get.dart';

import 'package:learn_getx/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:learn_getx/utils/utils.dart';
import 'package:learn_getx/res/routes/routes_name.dart';

class LogoutViewModel {
  UserPreference userPreference = UserPreference();
  
  logout() {
    userPreference.removeUser().then((value){
      Utils.snackBar('logout'.tr, 'logout_success'.tr);
      Get.toNamed(RoutesName.loginView);
    });
  }
}