import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/controllers/navigation_controller.dart';
import 'package:korek_app/utils/constants.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          _.goBack();
          return false;
        },
        child: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  CustomPaint(
                    size: MediaQuery.of(context).size,
                    painter: BottomCustomPainter(),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                      margin: const EdgeInsets.only(top: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BarButton(
                            isActive: _.activeScreen == "requests",
                            image: "assets/images/requests-icon.png",
                            title: "Requests",
                            onPressed: () {
                              _.navigateTo("requests");
                            },
                          ),
                          BarButton(
                            isActive: _.activeScreen == "chat",
                            image: "assets/images/chat-icon.png",
                            title: "Chat",
                            onPressed: () {
                              _.navigateTo("chat");
                            },
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          BarButton(
                            isActive: _.activeScreen == "services",
                            image: "assets/images/services-icon.png",
                            title: "Services",
                            onPressed: () {
                              _.navigateTo("order-history");
                            },
                          ),
                          BarButton(
                            isActive: _.activeScreen == "store",
                            image: "assets/images/store-icon.png",
                            title: "Store",
                            onPressed: () {
                              _.navigateTo("store");
                            },
                          ),
                        ],
                      )),
                  Center(
                    child: Transform.translate(
                      offset: const Offset(0, -25),
                      child: InkWell(
                        onTap: () {
                          _.navigateTo("home");
                        },
                        child: Opacity(
                          opacity: _.activeScreen == "home" ? 1 : 0.6,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: const Color(0xFF2F2E41),
                                border: Border.all(
                                    color: const Color(0xFF3F3D56), width: 5),
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: kBlackColor.withOpacity(0.2),
                                      offset: const Offset(0, 0),
                                      blurRadius: 8)
                                ]),
                            child: Center(
                              child: Stack(children: [
                                Transform.translate(
                                  offset: const Offset(-1, 0),
                                  child: Image.asset(
                                    "assets/images/car-icon.png",
                                    height: 25,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
          ),
        ]),
      );
    });
  }
}

class BarButton extends StatelessWidget {
  const BarButton({
    Key? key,
    required this.isActive,
    required this.image,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final bool isActive;
  final String image;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: isActive ? 14 : 0)),
          backgroundColor: MaterialStateProperty.all<Color>(
              isActive ? kPrimaryColor : Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            !isActive
                ? Image.asset(
                    image,
                    height: isActive ? 18 : 25,
                    color: isActive ? Colors.white : kGrayColor,
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(title,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
                  )
          ],
        ));
  }
}

class BottomCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 20);
    path.lineTo(0, 20);
    path.lineTo(size.width * 0.4, 20);
    // path.addOval(Rect.fromCenter(
    //     center: Offset(size.width * 0.5, 0), width: 100, height: 100));
    // path.arcToPoint(Offset(size.width * 0.6, 20),
    //     radius: const Radius.circular(2), clockwise: true);
    path.lineTo(size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 20, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
