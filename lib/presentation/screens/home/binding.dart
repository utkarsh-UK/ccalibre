import 'package:ccalibre/domain/usecases/applications/get_all_apps.dart';
import 'package:ccalibre/domain/usecases/builds/get_all_builds.dart';
import 'package:ccalibre/presentation/screens/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final getAllApplications = Get.find<GetAllApplications>();
    final getAllBuilds = Get.find<GetAllBuilds>();

    Get.lazyPut(
      () => HomeController(
          getAllApplications: getAllApplications, getAllBuilds: getAllBuilds),
    );
  }
}
