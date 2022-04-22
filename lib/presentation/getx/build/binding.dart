import 'package:ccalibre/domain/usecases/builds/get_all_builds.dart';
import 'package:ccalibre/domain/usecases/builds/start_new_build.dart';
import 'package:ccalibre/presentation/getx/build/controller.dart';
import 'package:get/get.dart';

class BuildBinding extends Bindings {
  @override
  void dependencies() {
    final getAllBuilds = Get.find<GetAllBuilds>();
    final startNewBuild = Get.find<StartNewBuild>();

    Get.lazyPut(
      () => BuildController(
        getAllBuilds: getAllBuilds,
        startNewBuild: startNewBuild,
      ),
    );
  }
}
