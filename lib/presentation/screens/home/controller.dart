import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:ccalibre/domain/usecases/applications/get_all_apps.dart';
import 'package:ccalibre/domain/usecases/builds/get_all_builds.dart';
import 'package:ccalibre/presentation/screens/home/applications/add_app_sheet.dart';
import 'package:ccalibre/presentation/screens/home/applications/start_build_sheet.dart';
import 'package:ccalibre/presentation/screens/home/applications/update_var_sheet.dart';
import 'package:ccalibre/presentation/screens/onboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final OnboardController _onboardController;

  final GetAllApplications _getAllApplications;
  final GetAllBuilds _getAllBuilds;

  HomeController({
    required GetAllApplications getAllApplications,
    required GetAllBuilds getAllBuilds,
  })  : _getAllApplications = getAllApplications,
        _getAllBuilds = getAllBuilds;

  final areApplicationsAdded = false.obs;
  final isBuildInProgress = false.obs;

  final applications = <Application>[].obs;
  final builds = <Build>[].obs;

  final storedUser = Rx<User?>(null);
  final token = ''.obs;

  @override
  void onInit() {
    super.onInit();

    _onboardController = Get.find<OnboardController>();

    storedUser.value = _onboardController.storedUser.value;
    token.value = _onboardController.storedUser.value?.token ?? '';

    if (storedUser.value != null) {
      getApplications();
      getBuilds();
    }
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

  Future<void> getBuilds() async {
    if (token.value.isEmpty) return;

    final failureOrBuilds = await _getAllBuilds(
      Params(token: token.value),
    );

    failureOrBuilds.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (fetchedBuilds) {
        builds.value = fetchedBuilds;
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
