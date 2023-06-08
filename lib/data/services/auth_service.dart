import 'package:korek_app/data/models/services/auth_register_model.dart';
import 'package:korek_app/data/services.dart';
import 'package:korek_app/utils/services/storage_service.dart';
import 'package:get/get.dart';

class AuthService extends Services {
  Future<bool> register(AuthRegisterModel data) async {
    await api
        .request(Services.register, "POST",
            loaderEnabled: true, data: data.toMap())
        .then((data) {
      if (data == null || data == false) {
        return false;
      }

      //Save access token & user data to storage
      // Get.find<StorageService>().token = data["accessToken"];
      // Get.find<StorageService>().userData = userData;
      // Get.forceAppUpdate();
      return true;
    });
    return true;
  }

  Future<bool> login() async => true;
}
