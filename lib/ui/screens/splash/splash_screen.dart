import 'package:flutter/material.dart';
import 'package:korek_app/ui/controllers/splash_controller.dart';
import 'package:korek_app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return Scaffold(
        backgroundColor: kBlackColor,
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/images/splash-image.png",
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            if (_.timeElapsed.value >= 1500)
              Positioned(
                bottom: 20,
                left: size.width / 2 - 50,
                child: Column(
                  children: [
                    Lottie.asset("assets/animations/loading.json",
                        width: 100,
                        height: 100,
                        repeat: true,
                        frameRate: FrameRate(60),
                        errorBuilder: (context, error, stackTrace) =>
                            const CircularProgressIndicator(
                              strokeWidth: 3,
                            )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Loading...",
                      style: TextStyle(fontSize: 12, color: kWhiteColor),
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }
}
