import 'package:ccalibre/presentation/screens/onboard/controller.dart';
import 'package:get/get.dart';

class OnboardBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardController());
  }
}
