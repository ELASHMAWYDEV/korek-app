// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/screens/chat/chat_screen.dart';
import 'package:korek_app/ui/screens/home/home_screen.dart';
import 'package:korek_app/ui/screens/requests/requests_screen.dart';
import 'package:korek_app/ui/screens/services/services_screen.dart';
import 'package:korek_app/ui/screens/store/store_screen.dart';

/**
 * Custom Navigation Controller for the bottom navigation
 */

class NavigationController extends GetxController {
  String activeScreen = "home";
  Widget activeChild = const HomeScreen();
  List previousScreens = <String>["home"];

  final Map<String, Widget> screens = {
    "home": const HomeScreen(),
    "requests": const RequestsScreen(),
    "chat": const ChatScreen(),
    "services": const ServicesScreen(),
    "store": const StoreScreen(),
  };

  void navigateTo(String screen) {
    //Check if lang exist on supported languages
    if (!screens.keys.contains(screen)) {
      return print("No screen found named: $screen");
    }

    //Check if the screen exists on stack
    if (previousScreens.contains(screen)) {
      previousScreens.removeRange(
          previousScreens.indexOf(screen), previousScreens.length - 1);
    }

    if (previousScreens.isEmpty) {
      previousScreens.add("home");
    }
    if (previousScreens.length != 1) {
      previousScreens.add(screen); //Add previous screen
    }
    activeScreen = screen;
    activeChild = screens[screen]!;

    update();
  }

  void goBack() {
    String lastScreen;
    //Check if lang exist on supported languages
    if (previousScreens.isEmpty) {
      previousScreens.add("home");
      print("No screens on the stack");
      return;
    }

    lastScreen = previousScreens.removeLast(); //Add previous screen
    activeScreen = lastScreen;
    activeChild = screens[lastScreen]!;

    update();
  }
}
