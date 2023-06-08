import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/data/models/services/auth_register_model.dart';
import 'package:korek_app/data/services/auth_service.dart';

class RegisterController extends GetxController {
  final AuthService authService = AuthService();

  int currentStep = 0;

  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
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
    emailInputController.addListener(() {
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

  Future<bool> register() async => await authService.register(AuthRegisterModel(
      name: nameInputController.text,
      email: emailInputController.text,
      countryCode: "+20",
      phoneNumber: phoneInputController.text,
      password: password,
      car: CarModel(
          brand: brand ?? "",
          model: model ?? "",
          vendor: "",
          year: int.tryParse(year) ?? 0,
          plateNumber: plateNumberInputController.text,
          chassisNumber: chassisNumberInputController.text,
          licenseImageFront: "image.png",
          licenseImageBack: "image.png",
          carImage: "image.png")));
}
