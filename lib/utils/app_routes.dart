import 'package:korek_app/ui/screens/intro/intro_screen.dart';
import 'package:korek_app/ui/screens/login/login_screen.dart';
import 'package:korek_app/ui/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initialRoute = "/splash";

  static List<GetPage> routes = [
    GetPage(name: "/splash", page: () => const SplashScreen()),
    GetPage(name: "/intro", page: () => IntroScreen()),
    GetPage(name: "/login", page: () => const LoginScreen()),
  ];
}
