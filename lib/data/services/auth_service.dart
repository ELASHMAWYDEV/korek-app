import 'package:korek_app/data/services.dart';
import 'package:korek_app/utils/services/storage_service.dart';
import 'package:get/get.dart';

class AuthService extends Services {
  Future<bool> register() async => true;
  //  await api.request(
  //         Services.registerUser, "POST", loaderEnabled: false, data: {
  //       "userId": Get.find<StorageService>().userData?.userId ?? ""
  //     }).then((data) {
  //       if (data == null || data == false) {
  //         return false;
  //       }

  //       final UserModel userData = UserModel.fromJson(data["user"]);
  //       //Save access token & user data to storage
  //       Get.find<StorageService>().token = data["accessToken"];
  //       Get.find<StorageService>().userData = userData;
  //       Get.forceAppUpdate();
  //       return true;
  //     });

  Future<bool> login() async => true;
}
