import 'package:ccalibre/core/theme/theme.dart';
import 'package:ccalibre/core/utils/routes.dart';
import 'package:ccalibre/data/services/storage_service.dart';
import 'package:ccalibre/presentation/screens/home/applications/application_details.dart';
import 'package:ccalibre/presentation/screens/home/binding.dart';
import 'package:ccalibre/presentation/screens/home/view.dart';
import 'package:ccalibre/presentation/screens/onboard/bindings.dart';
import 'package:ccalibre/presentation/screens/onboard/github_username.dart';
import 'package:ccalibre/presentation/screens/onboard/upload_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => SecuredStorageService().init());
  // DependencyInjector().inject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return GetMaterialApp(
      title: 'CCalibre',
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.getAppThemeData(),
      initialRoute: Routes.initialRoute,
      getPages: [
        GetPage(
          name: Routes.initialRoute,
          page: () => const UploadToken(),
          binding: OnboardBinding(),
        ),
        GetPage(name: Routes.githubUsernameRoute, page: () => GithubUsername()),
        GetPage(
          name: Routes.homeRoute,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Routes.applicationDetailsRoute,
          page: () => const ApplicationDetails(),
        ),
      ],
    );
  }
}
