import 'package:ccalibre/domain/usecases/user/get_public_repos.dart';
import 'package:ccalibre/presentation/screens/user/controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    final getPublicRepos = Get.find<GetPublicRepos>();

    Get.lazyPut(() => UserController(getPublicRepos));
  }
}
