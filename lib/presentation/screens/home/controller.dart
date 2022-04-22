import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:ccalibre/domain/usecases/applications/create_new_app.dart';
import 'package:ccalibre/domain/usecases/applications/get_all_apps.dart';
import 'package:ccalibre/domain/usecases/applications/get_application.dart';
import 'package:ccalibre/domain/usecases/builds/get_all_builds.dart';
import 'package:ccalibre/domain/usecases/builds/start_new_build.dart';
import 'package:ccalibre/presentation/screens/home/applications/add_app_sheet.dart';
import 'package:ccalibre/presentation/screens/home/builds/start_build_sheet.dart';
import 'package:ccalibre/presentation/screens/home/applications/update_var_sheet.dart';
import 'package:ccalibre/presentation/screens/onboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final OnboardController _onboardController;

  final GetAllApplications _getAllApplications;
  final GetApplication _getApplication;
  final CreateNewApplication _createNewApplication;
  final GetAllBuilds _getAllBuilds;
  final StartNewBuild _startNewBuild;

  HomeController({
    required GetAllApplications getAllApplications,
    required GetAllBuilds getAllBuilds,
    required GetApplication getApplication,
    required CreateNewApplication createNewApplication,
    required StartNewBuild startNewBuild,
  })  : _getAllApplications = getAllApplications,
        _getApplication = getApplication,
        _createNewApplication = createNewApplication,
        _getAllBuilds = getAllBuilds,
        _startNewBuild = startNewBuild;

  final areApplicationsAdded = false.obs;
  final isBuildInProgress = false.obs;
  final isSelectedAppLoading = false.obs;

  final applications = <Application>[].obs;
  final builds = <Build>[].obs;
  final application = Rx<Application?>(null);

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

  Future<void> getApplication(String applicationID) async {
    if (token.value.isEmpty) return;

    isSelectedAppLoading.value = true;

    final failureOrApplication = await _getApplication(
      Params(token: token.value, applicationID: applicationID),
    );

    failureOrApplication.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (fetchedApp) {
        application.value = fetchedApp;
      },
    );

    isSelectedAppLoading.value = false;
  }

  Future<void> creatApplication(String repositoryURL) async {
    if (token.value.isEmpty) return;

    final failureOrApplication = await _createNewApplication(
      Params(token: token.value, repoURL: repositoryURL),
    );

    failureOrApplication.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (_) {
        getApplications();
      },
    );
  }

  Future<void> startBuild(String appID, String workID, String branch) async {
    if (token.value.isEmpty) return;

    final failureOrSuccess = await _startNewBuild(
      Params(
        token: token.value,
        applicationID: appID,
        workflowID: workID,
        branch: branch,
      ),
    );

    failureOrSuccess.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (_) {
        isBuildInProgress.value = true;
      },
    );
  }

  void setApplicationsAdded(bool value) => areApplicationsAdded.value = value;

  void resetCurrentApplication() => application.value = null;

  void showAddApplicationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      builder: (_) => AddAppSheet(),
    );
  }

  void showStartBuildSheet(BuildContext context, Application app) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      builder: (_) => StartBuildSheet(application: app),
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
