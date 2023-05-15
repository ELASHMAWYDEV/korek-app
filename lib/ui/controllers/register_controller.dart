import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/data/services/auth_service.dart';

class RegisterController extends GetxController {
  final AuthService authService = AuthService();

  int currentStep = 0;

  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController dobInputController = TextEditingController();
  final TextEditingController addressInputController = TextEditingController();
  final TextEditingController phoneInputController = TextEditingController();
  String? brand;
  String? model;
  String? year;
  final TextEditingController plateNumberInputController =
      TextEditingController();
  final TextEditingController chassisNumberInputController =
      TextEditingController();

  String? serviceProvider;

  @override
  void onInit() {
    super.onInit();
    nameInputController.addListener(() {
      update();
    });
    dobInputController.addListener(() {
      update();
    });
    addressInputController.addListener(() {
      update();
    });
    phoneInputController.addListener(() {
      update();
    });
    plateNumberInputController.addListener(() {
      update();
    });
    chassisNumberInputController.addListener(() {
      update();
    });
  }

  Future<bool> register() async => await authService.register();
}
