import 'package:ccalibre/domain/usecases/onboard/store_user_data.dart';
import 'package:ccalibre/presentation/screens/onboard/controller.dart';
import 'package:get/get.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    final storeUserData = Get.find<StoreUserData>();

    Get.lazyPut(() => OnboardController(storeUserData));
  }
}
