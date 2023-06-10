import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:korek_app/utils/services/navigation_service.dart';
import 'package:get/get.dart';

const Color kPrimaryColor = Color(0xFFEE5253);
const Color kPrimaryDarkColor = Color(0xFF1c1832);
const Color kPrimaryLightColor = Color(0xFF5380d1);
const Color kSecondaryColor = Color(0xFF3F3D56);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kGrayColor = Color(0xFFC8C3CB);
const Color kGrayLightColor = Color(0xFFDFDFDF);
const Color kGrayDarkColor = Color(0xFF8395A7);
const Color kRedColor = Color(0xFFeb2a14);
const Color kGreenColor = Color(0xFF00c89d);
const Color kOrangeColor = Color(0xFFFF9F22);
const Color kBlackColor = Color(0xFF000000);

const String kAppTitle = "Korek";
String kFontFamilyPrimary = "Montserrat";

const String kApiUrl = kReleaseMode
    ? "https://korek-app.herokuapp.com"
    : "https://korek-app.herokuapp.com";

final Size size = MediaQuery.of(Get.find<NavigationService>().context()).size;
