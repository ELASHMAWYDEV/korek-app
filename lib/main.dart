import 'package:flutter/material.dart';
import 'package:korek_app/utils/constants.dart';
import 'package:korek_app/utils/app_routes.dart';
import 'package:korek_app/utils/services/api_service.dart';
import 'package:korek_app/utils/services/connection_service.dart';
import 'package:korek_app/utils/services/localization_service.dart';
import 'package:korek_app/utils/services/navigation_service.dart';
import 'package:korek_app/utils/services/storage_service.dart';
import 'package:korek_app/utils/translations/app_translations.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await setupFirebase();

  Get.put(NavigationService.init(), permanent: true);
  await Get.putAsync(() => ConnectionService.init(), permanent: true);
  await Get.putAsync(() => StorageService.init(), permanent: true);
  Get.put(LocalizationService.init(), permanent: true);
  Get.put(ApiService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.find<NavigationService>().navigationKey,
      title: kAppTitle,
      translations: AppTranslations(),
      locale: Get.find<LocalizationService>().activeLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: SupportedLocales.all,
      fallbackLocale: SupportedLocales.english,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: kWhiteColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kBlackColor,
                fontFamily: kFontFamilyPrimary,
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
