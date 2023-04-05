import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/data/services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService authService = AuthService();

  final TextEditingController phoneInputController = TextEditingController();
  final TextEditingController otp1InputController = TextEditingController();
  final TextEditingController otp2InputController = TextEditingController();
  final TextEditingController otp3InputController = TextEditingController();
  final TextEditingController otp4InputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    otp1InputController.addListener(() {
      if (otp1InputController.text.length == 1) {
        FocusScope.of(Get.context!).nextFocus();
      }
    });
    otp2InputController.addListener(() {
      if (otp1InputController.text.length == 1) {
        FocusScope.of(Get.context!).nextFocus();
      }
    });
    otp3InputController.addListener(() {
      if (otp1InputController.text.length == 1) {
        FocusScope.of(Get.context!).nextFocus();
      }
    });
    otp4InputController.addListener(() {
      login();
    });
  }

  Future<bool> login() async => await authService.login();
}
