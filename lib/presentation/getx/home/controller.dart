import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:ccalibre/domain/usecases/applications/create_new_app.dart';
import 'package:ccalibre/domain/usecases/applications/get_all_apps.dart';
import 'package:ccalibre/domain/usecases/applications/get_application.dart';
import 'package:ccalibre/presentation/getx/onboard/controller.dart';
import 'package:ccalibre/presentation/screens/home/applications/add_app_sheet.dart';
import 'package:ccalibre/presentation/screens/home/applications/update_var_sheet.dart';
import 'package:ccalibre/presentation/screens/home/builds/start_build_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final OnboardController _onboardController;

  final GetAllApplications _getAllApplications;
  final GetApplication _getApplication;
  final CreateNewApplication _createNewApplication;

  HomeController({
    required GetAllApplications getAllApplications,
    required GetApplication getApplication,
    required CreateNewApplication createNewApplication,
  })  : _getAllApplications = getAllApplications,
        _getApplication = getApplication,
        _createNewApplication = createNewApplication;

  late final TextEditingController usernameController;

  final areApplicationsAdded = false.obs;
  final isBuildInProgress = false.obs;
  final isSelectedAppLoading = false.obs;

  final applications = <Application>[].obs;
  final application = Rx<Application?>(null);

  final storedUser = Rx<User?>(null);
  final token = ''.obs;

  @override
  void onInit() {
    super.onInit();

    _onboardController = Get.find<OnboardController>();
    usernameController = TextEditingController();

    storedUser.value = _onboardController.storedUser.value;
    usernameController.text = storedUser.value?.githubUsername ?? '';
    token.value = _onboardController.storedUser.value?.token ?? '';

    if (storedUser.value != null) {
      getApplications();
    }
  }

  @override
  void onClose() {
    super.onClose();

    usernameController.dispose();
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

  void setApplicationsAdded(bool value) => areApplicationsAdded.value = value;

  void resetCurrentApplication() => application.value = null;

  void showAddApplicationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      builder: (_) => AddAppSheet(),
    );
  }

  void showStartBuildSheet(
    BuildContext context,
    Application app, {
    bool shouldPresetWorkflow = false,
    String workflowName = 'Select Workflow',
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      builder: (_) => StartBuildSheet(
        application: app,
        shouldPresetWorkflow: shouldPresetWorkflow,
        selectedWorkflow: workflowName,
      ),
    );
  }

  void showUpdateVarSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      builder: (_) => const UpdateVarSheet(),
    );
  }

  void setUsername() {
    usernameController.text = storedUser.value?.githubUsername ?? '';
  }
}
