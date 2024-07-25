import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_flutter_app/core/widgets/loading_dialog.dart';
import 'package:dio/dio.dart' as responsee;
import 'package:my_flutter_app/models/login_response.dart';
import 'package:my_flutter_app/routes/app_routes.dart';

import '../../../core/helper/input_validator.dart';
import '../../../core/widgets/costume_dialog.dart';
import '../../../providers/auth_provider.dart';

class LoginLogic extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _provider = AuthProvider();
  LoginResponse loginResponse = LoginResponse();
  final storage = GetStorage();

  validateFields() {
    if (InputValidators.emailValidator(emailController.text) == null &&
        InputValidators.simpleValidation(passwordController.text) == null) {
      return true;
    }
    return false;
  }

  void login() async {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          context = context;
          return Loading("logging in..", false);
        });
    responsee.Response response = await _provider.login(
        emailController.text, passwordController.text, "1234", "1234");
    navigator?.pop(Get.context!);

    if (response.statusCode == 200 || response.statusCode == 201) {
      loginResponse = LoginResponse.fromJson(response.data);
      storage.write("token", loginResponse.token);
      storage.write("user_id", loginResponse.user!.id ?? 0);
      storage.write("user_name", loginResponse.user?.name);
      storage.write("is_login", true);
      Get.toNamed(AppRoutes.homeScreen);
    } else {
      loginResponse = LoginResponse.fromJson(response.data);
      showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            context = context;
            return CostumeDialog(
              title: loginResponse.status ?? "error",
              titleColor: Colors.red,
              message: loginResponse.message ?? "invalid credentials",
              buttom1Lavel: "Retry",
              onButton1Clicked: () {
                login();
              },
              button2Enabled: false,
            );
          });
    }
  }
}
