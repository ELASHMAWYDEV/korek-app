import 'dart:async';
import 'package:korek_app/data/services/auth_service.dart';
import 'package:korek_app/ui/components/alert_prompt_box.dart';
import 'package:korek_app/utils/services/storage_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthService authService = AuthService();

  RxInt timeElapsed = 0.obs;

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      timeElapsed.value += 500;
      if (timeElapsed.value >= 1500) update();
    });

    Future.delayed(const Duration(milliseconds: 4500), () async {
      //Register the user
      final bool isRegistered = await register();

      if (isRegistered) {
        // Get.find<StorageService>()
        //     .triggerOnce(StorageKeys.hasSeenIntroScreens)
        //     .then((value) => Get.offAndToNamed("/intro"));
        // .catchError((e) => Get.offAndToNamed("/home"));

        Get.offAndToNamed("/intro");
      } else {
        // @TODO: handle if registration is broken, show no internet connection modal for ex.
        AlertPromptBox.showError(
            error: "Please check your internet connection");
      }
    });
  }

  Future<bool> register() async => await authService.register();
}
