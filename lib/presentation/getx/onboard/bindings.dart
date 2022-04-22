import 'package:ccalibre/domain/usecases/onboard/get_user_data.dart';
import 'package:ccalibre/domain/usecases/onboard/store_user_data.dart';
import 'package:ccalibre/presentation/getx/onboard/controller.dart';
import 'package:get/get.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    final storeUserData = Get.find<StoreUserData>();
    final getUserData = Get.find<GetUserData>();

    Get.lazyPut(
      () => OnboardController(
        storeUserData: storeUserData,
        getUserData: getUserData,
      ),
    );
  }
}
