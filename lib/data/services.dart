import 'package:korek_app/utils/services/api_service.dart';
import 'package:get/get.dart';

abstract class Services {
  static String register = "/auth/customer/register"; //POST
  static String login = "/auth/customer/login"; //POST
  static String category = "/category"; //POST, GET, DELETE, PATCH
  static String color = "/color"; //POST, GET, DELETE, PATCH
  static String tag = "/tag"; //POST, GET, DELETE, PATCH
  static String size = "/size"; //POST, GET, DELETE, PATCH
  static String product = "/product"; //POST, GET, DELETE, PATCH
  static String brand = "/brand"; //POST, GET, DELETE, PATCH
  static String model = "/model"; //POST, GET, DELETE, PATCH
  static String vendor = "/vendor"; //POST, GET, DELETE, PATCH

  final ApiService _api = Get.find<ApiService>();
  ApiService get api => _api;
}
