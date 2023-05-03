import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/data/services/auth_service.dart';

class RegisterController extends GetxController {
  final AuthService authService = AuthService();

  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController dobInputController = TextEditingController();
  final TextEditingController addressInputController = TextEditingController();
  final TextEditingController phoneInputController = TextEditingController();
  final TextEditingController brandInputController = TextEditingController();
  final TextEditingController modelInputController = TextEditingController();
  final TextEditingController yearInputController = TextEditingController();
  final TextEditingController plateNumberInputController =
      TextEditingController();
  final TextEditingController chassisNumberInputController =
      TextEditingController();

  String? serviceProvider;

  Future<bool> register() async => await authService.register();
}
