import 'package:flutter/material.dart';
import 'package:korek_app/utils/services/localization_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final test_token = ""
abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String token = "TOKEN";
  static const String activeLocale = "ACTIVE_LOCAL";
  static const String client = "CLIENT";
  // static const String userData = "USER_DATA";
  static const String hasSeenIntroScreens = "HAS_SEEN_INTRO_SCREENS";
}

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  /// Delete stored data by key
  void deleteKey(String key) {
    _prefs.remove(key);
  }

  /// Trigger anything for 1 time, like Dialogues
  Future<String> triggerOnce(String key) async {
    final value = _prefs.getString(key);
    if (value == null) {
      _prefs.setString(key, "true");
      return "true";
    } else {
      throw "key: $key, is triggered before";
    }
  }

  //TOKEN
  String get token {
    return _prefs.getString(StorageKeys.token) ?? "";
  }

  set token(String? token) {
    _prefs.setString(StorageKeys.token, token.toString());
  }

  //Active Locale
  Locale get activeLocale {
    return Locale(_prefs.getString(StorageKeys.activeLocale) ??
        SupportedLocales.english.toString());
  }

  set activeLocale(Locale activeLocal) {
    _prefs.setString(StorageKeys.activeLocale, activeLocal.toString());
  }

  // //User Data
  // UserModel? get userData {
  //   return _prefs.getString(StorageKeys.userData) == null
  //       ? null
  //       : UserModel.fromJson(
  //           jsonDecode(_prefs.getString(StorageKeys.userData)!));
  // }

  // set userData(UserModel? userData) {
  //   if (userData == null) {
  //     _prefs.remove(StorageKeys.userData);
  //   } else {
  //     _prefs.setString(StorageKeys.userData, jsonEncode(userData.toJson()));
  //   }
  // }
}
