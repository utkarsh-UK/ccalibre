import 'package:ccalibre/domain/usecases/applications/create_new_app.dart';
import 'package:ccalibre/domain/usecases/applications/get_all_apps.dart';
import 'package:ccalibre/domain/usecases/applications/get_application.dart';
import 'package:ccalibre/domain/usecases/builds/get_all_builds.dart';
import 'package:ccalibre/domain/usecases/builds/start_new_build.dart';
import 'package:ccalibre/presentation/screens/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final getAllApplications = Get.find<GetAllApplications>();
    final getAllBuilds = Get.find<GetAllBuilds>();
    final getApplication = Get.find<GetApplication>();
    final createNewApplication = Get.find<CreateNewApplication>();
    final startNewBuild = Get.find<StartNewBuild>();

    Get.lazyPut(
      () => HomeController(
        getAllApplications: getAllApplications,
        getAllBuilds: getAllBuilds,
        getApplication: getApplication,
        createNewApplication: createNewApplication,
        startNewBuild: startNewBuild,
      ),
    );
  }
}
