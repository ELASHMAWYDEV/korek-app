import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/bottom_navigation.dart';
import 'package:korek_app/ui/controllers/navigation_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NavigationController navigation = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (_) {
      return Scaffold(
          body: Stack(children: [_.activeChild, const BottomNavigation()]));
    });
  }
}
