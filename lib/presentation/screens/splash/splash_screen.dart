import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/getx/onboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100.0.wp,
            height: 50.0.hp,
            child: LottieBuilder.asset('assets/anim/spinning-squares.json'),
          ),
          Text(
            'Taking you to CCalibre',
            style: textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          Text(
            'Please wait...',
            style: textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
