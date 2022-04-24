import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:ccalibre/domain/usecases/builds/get_all_builds.dart';
import 'package:ccalibre/domain/usecases/builds/start_new_build.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BuildController extends GetxController {
  late final HomeController _homeController;
  late final TextEditingController variableKeyController;
  late final TextEditingController variableValueController;

  final GetAllBuilds _getAllBuilds;
  final StartNewBuild _startNewBuild;

  BuildController({
    required GetAllBuilds getAllBuilds,
    required StartNewBuild startNewBuild,
  })  : _getAllBuilds = getAllBuilds,
        _startNewBuild = startNewBuild;

  final allBuilds = <Build>[].obs;
  final applicationBuilds = <Build>[].obs;
  final envVariables = <String, String>{}.obs;

  @override
  void onInit() {
    super.onInit();

    _homeController = Get.find<HomeController>();
    variableKeyController = TextEditingController();
    variableValueController = TextEditingController();

    if (_homeController.storedUser.value != null) {
      getBuilds();
    }
  }

  @override
  void onClose() {
    super.onClose();

    variableKeyController.dispose();
    variableValueController.dispose();
  }

  Future<void> getBuilds() async {
    if (_homeController.token.value.isEmpty) return;

    final failureOrBuilds = await _getAllBuilds(
      Params(token: _homeController.token.value),
    );

    failureOrBuilds.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (fetchedBuilds) {
        allBuilds.value = fetchedBuilds;
      },
    );
  }

  Future<void> getBuildsForApplication(String appID) async {
    if (_homeController.token.value.isEmpty) return;

    final failureOrBuilds = await _getAllBuilds(
      Params(token: _homeController.token.value, applicationID: appID),
    );

    failureOrBuilds.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (fetchedBuilds) {
        applicationBuilds.value = fetchedBuilds;
      },
    );
  }

  Future<void> startBuild(String appID, String workID, String branch) async {
    if (_homeController.token.value.isEmpty) return;

    final failureOrSuccess = await _startNewBuild(
      Params(
          token: _homeController.token.value,
          applicationID: appID,
          workflowID: workID,
          branch: branch,
          buildEnvironments: {'variables': envVariables}),
    );

    failureOrSuccess.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (_) {
        _homeController.isBuildInProgress.value = true;
      },
    );
  }

  void addEnvVariable() {
    if (variableKeyController.text.trim().isEmpty ||
        variableValueController.text.trim().isEmpty) return;

    envVariables.putIfAbsent(
      variableKeyController.text.trim(),
      () => variableValueController.text.trim(),
    );

    variableKeyController.clear();
    variableValueController.clear();
  }
}
