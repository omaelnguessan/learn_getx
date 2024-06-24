import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learn_getx/utils/utils.dart';
import 'package:learn_getx/view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: '*',
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar(
              'password_label'.tr, 'password_validation'.tr);
        }
      },
      decoration: InputDecoration(
          hintText: 'password_hint'.tr,
          labelText: 'password_label'.tr,
          border: OutlineInputBorder()),
    );
  }
}
