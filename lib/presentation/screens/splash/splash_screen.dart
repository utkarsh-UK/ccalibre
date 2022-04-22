import 'package:ccalibre/presentation/getx/onboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final OnboardController _onboardController = Get.find<OnboardController>();

  @override
  void initState() {
    super.initState();

    _onboardController.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Text(
          'Checking your token... Please wait!',
          style: textTheme.headline4,
        ),
      ),
    );
  }
}
