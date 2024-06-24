import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learn_getx/view_models/controller/login/login_view_model.dart';
import 'package:learn_getx/utils/utils.dart';

class InputEmailWidget extends StatelessWidget {
   InputEmailWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar(
              'email_label'.tr, 'email_validation'.tr);
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
            context,
            loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr,
          labelText: 'email_label'.tr,
          border: OutlineInputBorder()),
    );
  }
}
