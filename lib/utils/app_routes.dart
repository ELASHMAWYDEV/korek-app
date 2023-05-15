import 'package:korek_app/ui/screens/intro/intro_screen.dart';
import 'package:korek_app/ui/screens/login/login_screen.dart';
import 'package:korek_app/ui/screens/main/main_screen.dart';
import 'package:korek_app/ui/screens/notifications/notifications_screen.dart';
import 'package:korek_app/ui/screens/profile/profile_screen.dart';
import 'package:korek_app/ui/screens/register/register_screen.dart';
import 'package:korek_app/ui/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initialRoute = "/splash";

  static List<GetPage> routes = [
    GetPage(name: "/splash", page: () => const SplashScreen()),
    GetPage(name: "/intro", page: () => IntroScreen()),
    GetPage(name: "/login", page: () => const LoginScreen()),
    GetPage(name: "/register", page: () => const RegisterScreen()),
    GetPage(name: "/main", page: () => const MainScreen()),
    GetPage(name: "/profile", page: () => const ProfileScreen()),
    GetPage(name: "/notifications", page: () => const NotificationsScreen()),
  ];
}
