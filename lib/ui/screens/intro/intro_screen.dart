import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/controllers/intro_controller.dart';
import 'package:korek_app/ui/screens/intro/components/intro_slide.dart';
import 'package:korek_app/utils/constants.dart';
import 'package:get/get.dart';
import 'components/intro_header.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(builder: (_) {
      return Scaffold(
        body: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 110),
                child: Visibility(
                  visible: _.activeIndex != 0,
                  child: const IntroHeader(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Visibility(
                    visible: _.activeIndex == _.introSlides.length - 1,
                    child: const SizedBox()),
              ),
              CarouselSlider(
                  items: _.introSlides
                      .map((slide) => IntroSlide(slide: slide))
                      .toList(),
                  carouselController: _.sliderController,
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enlargeFactor: 1.5,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      pauseAutoPlayInFiniteScroll: true,
                      height: MediaQuery.of(context).size.height * 0.57,
                      initialPage: _.activeIndex,
                      onPageChanged: (index, reason) {
                        _.activeIndex = index;
                        _.update();
                      })),
              SizedBox(
                width: 80,
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      _.introSlides.length,
                      (index) => Container(
                          width: _.activeIndex == index ? 15 : 10,
                          height: _.activeIndex == index ? 15 : 10,
                          decoration: BoxDecoration(
                              color: _.activeIndex == index
                                  ? kPrimaryColor
                                  : kBlackColor,
                              borderRadius: BorderRadius.circular(20)))),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MainButton(
                onPressed: () {
                  if (_.activeIndex == _.introSlides.length - 1) {
                    Get.offAllNamed("/register");
                  } else {
                    _.sliderController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                },
                text: _.activeIndex == 0
                    ? "Get Started"
                    : _.activeIndex == _.introSlides.length - 1
                        ? "Signup"
                        : "Next",
                endIcon: const Icon(
                  Icons.arrow_forward_ios,
                  color: kWhiteColor,
                  size: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: _.activeIndex == _.introSlides.length - 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: kBlackColor, fontSize: 12),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.offAllNamed("/login");
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
