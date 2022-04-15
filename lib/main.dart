import 'package:ccalibre/core/theme/theme.dart';
import 'package:ccalibre/presentation/screens/home/binding.dart';
import 'package:ccalibre/presentation/screens/home/view.dart';
import 'package:ccalibre/presentation/screens/onboard/bindings.dart';
import 'package:ccalibre/presentation/screens/onboard/upload_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  // await GetStorage.init();
  // await Get.putAsync(() => StorageService().init());
  // DependencyInjector().inject();

  HomeBinding().dependencies();
  
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
      home: HomeScreen(),
    );
  }
}
