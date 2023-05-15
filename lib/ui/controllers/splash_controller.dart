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

    Future.delayed(const Duration(milliseconds: 6500), () async {
      Get.find<StorageService>()
          .triggerOnce(StorageKeys.hasSeenIntroScreens)
          .then((value) => Get.offAndToNamed("/intro"))
          .catchError((e) {
        if (Get.find<StorageService>().token != "") {
          return Get.offAndToNamed("/main");
        }
        Get.offAndToNamed("/login");
      });

      Get.offAndToNamed("/intro");
    });
  }
}
