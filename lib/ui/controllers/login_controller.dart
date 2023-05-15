import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/data/services/auth_service.dart';
import 'package:korek_app/utils/services/storage_service.dart';

class LoginController extends GetxController {
  final AuthService authService = AuthService();

  final TextEditingController phoneInputController = TextEditingController();
  final TextEditingController otp1InputController = TextEditingController();
  final TextEditingController otp2InputController = TextEditingController();
  final TextEditingController otp3InputController = TextEditingController();
  final TextEditingController otp4InputController = TextEditingController();

  late FocusNode otp1Focus = FocusNode();
  late FocusNode otp2Focus = FocusNode();
  late FocusNode otp3Focus = FocusNode();
  late FocusNode otp4Focus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    phoneInputController.addListener(() {
      update();
    });

    otp1InputController.addListener(() {
      if (otp1InputController.text.length == 1) {
        FocusScope.of(Get.context!).requestFocus(otp2Focus);
      }
    });
    otp2InputController.addListener(() {
      if (otp2InputController.text.length == 1) {
        FocusScope.of(Get.context!).requestFocus(otp3Focus);
      } else {
        FocusScope.of(Get.context!).requestFocus(otp1Focus);
      }
    });
    otp3InputController.addListener(() {
      if (otp3InputController.text.length == 1) {
        FocusScope.of(Get.context!).requestFocus(otp4Focus);
      } else {
        FocusScope.of(Get.context!).requestFocus(otp2Focus);
      }
    });
    otp4InputController.addListener(() {
      if (otp4InputController.text.length == 1) {
        login();
      } else {
        FocusScope.of(Get.context!).requestFocus(otp3Focus);
      }
    });
  }

  Future<bool> login() async {
    // TODO: implement login
    await authService.login();
    Get.find<StorageService>().token = "test_token";

    Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed("/main");
    });

    return true;
  }
}
