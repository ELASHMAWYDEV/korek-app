import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double imageHeight = 260;

class IntroController extends GetxController {
  int activeIndex = 0;
  bool isWelcomBonusAnimating = false;
  final CarouselController sliderController = CarouselController();

  final List<SlideModel> introSlides = [
    SlideModel(
      image: Image.asset("assets/images/intro-1.png", height: imageHeight),
    ),
    SlideModel(
        image: Image.asset("assets/images/intro-2.png", height: imageHeight),
        title: "All Your Cars in 1 Place",
        description:
            "Register the details of all your cars, and follow up their maintainence schedule!"),
    SlideModel(
        image: Image.asset("assets/images/intro-3.png", height: imageHeight),
        title: "Register with your Service Provider",
        description:
            "Choose your car’s service provider to follow up with him and ask for check-ups!"),
    SlideModel(
        image: Image.asset("assets/images/intro-4.png", height: imageHeight),
        title: "All services to your Location",
        description: "Choose any of our services, set your location. Voila!"),
  ];

  void next() {
    if (activeIndex == introSlides.length - 1) {
      Get.offAndToNamed("/home");
    } else {
      activeIndex += 1;
      sliderController.animateToPage(activeIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
    update();
  }

  void prev() {
    if (activeIndex != 0) {
      activeIndex -= 1;
      sliderController.animateToPage(activeIndex,
          duration: const Duration(milliseconds: 700), curve: Curves.easeOut);
    }
    update();
  }
}

class SlideModel {
  Image image;
  String? title;
  String? description;

  SlideModel({
    required this.image,
    this.title,
    this.description,
  });
}
