import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/domain/entities/repository.dart';
import 'package:ccalibre/domain/usecases/user/get_public_repos.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final GetPublicRepos _getPublicRepos;

  UserController(this._getPublicRepos);

  final repositories = <Repository>[].obs;
  final selectedRepoURL = ''.obs;
  final selectedWorkflowID = ''.obs;
  final selectedBranch = ''.obs;

  Future<void> getPublicRepositories(String username) async {
    final failureOrApplications =
        await _getPublicRepos(Params(githubUsername: username));

    failureOrApplications.fold(
      (failure) => debugPrint(Helpers.convertFailureToString(failure)),
      (fetchedRepos) {
        repositories.value = fetchedRepos;
      },
    );
  }

  void setSelectedRepoURL(String url) => selectedRepoURL.value = url;

  void setSelectedWorkflowID(String work) => selectedWorkflowID.value = work;

  void setSelectedBranch(String branch) => selectedBranch.value = branch;
}