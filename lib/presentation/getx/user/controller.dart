import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/domain/entities/repository.dart';
import 'package:ccalibre/domain/usecases/user/get_public_repos.dart';
import 'package:ccalibre/presentation/widgets/dialog_animation_wrapper.dart';
import 'package:ccalibre/presentation/widgets/message_dialog.dart';
import 'package:flutter/material.dart';
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

  
  Future<T?> showDialog<T>({
    required BuildContext context,
    required String title,
    required String message,
    String? primaryBtnText,
    VoidCallback? onPrimaryBtnClick,
  }) {
    return showGeneralDialog(
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      barrierDismissible: true,
      barrierLabel: 'label',
      pageBuilder: (ctx, anim1, anim2) => MessageDialog(
        title: title,
        message: message,
        onPrimaryButtonClick: onPrimaryBtnClick,
        primaryBtnText: primaryBtnText ?? 'Next',
      ),
      transitionBuilder: (context, anim1, anim2, child) =>
          DialogAnimationWrapper(animationValue: anim1, child: child),
    );
  }


  void setSelectedRepoURL(String url) => selectedRepoURL.value = url;

  void setSelectedWorkflowID(String work) => selectedWorkflowID.value = work;

  void setSelectedBranch(String branch) => selectedBranch.value = branch;
}
