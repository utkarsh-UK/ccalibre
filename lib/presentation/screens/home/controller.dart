import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:ccalibre/domain/usecases/applications/get_all_apps.dart';
import 'package:ccalibre/presentation/screens/home/applications/add_app_sheet.dart';
import 'package:ccalibre/presentation/screens/home/applications/start_build_sheet.dart';
import 'package:ccalibre/presentation/screens/home/applications/update_var_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetAllApplications _getAllApplications;

  HomeController(this._getAllApplications);

  final areApplicationsAdded = false.obs;
  final isBuildInProgress = false.obs;
  final applications = <Application>[].obs;
  final storedUser = Rx<User?>(null);
  final token = ''.obs;

  @override
  void onInit() {
    super.onInit();

    getApplications();
  }

  Future<void> getApplications() async {
    if (token.value.isEmpty) return;

    final failureOrApplications = await _getAllApplications(
       Params(token: token.value),
    );

    failureOrApplications.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (fetchedApplications) {
        areApplicationsAdded.value = fetchedApplications.isNotEmpty;
        applications.value = fetchedApplications;
      },
    );
  }

  void setApplicationsAdded(bool value) => areApplicationsAdded.value = value;

  void showAddApplicationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      builder: (_) => const AddAppSheet(),
    );
  }

  void showStartBuildSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      builder: (_) => const StartBuildSheet(),
    );
  }

  void showUpdateVarSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      builder: (_) => const UpdateVarSheet(),
    );
  }
}
