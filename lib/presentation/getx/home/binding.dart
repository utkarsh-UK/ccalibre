import 'package:ccalibre/domain/usecases/applications/create_new_app.dart';
import 'package:ccalibre/domain/usecases/applications/get_all_apps.dart';
import 'package:ccalibre/domain/usecases/applications/get_application.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final getAllApplications = Get.find<GetAllApplications>();
    final getApplication = Get.find<GetApplication>();
    final createNewApplication = Get.find<CreateNewApplication>();

    Get.lazyPut(
      () => HomeController(
        getAllApplications: getAllApplications,
        getApplication: getApplication,
        createNewApplication: createNewApplication,
      ),
      fenix: true,
    );
  }
}
