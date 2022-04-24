import 'dart:io';

import 'package:ccalibre/core/usecases/usecase.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/core/utils/routes.dart';
import 'package:ccalibre/domain/entities/user.dart';
import 'package:ccalibre/domain/usecases/onboard/get_user_data.dart';
import 'package:ccalibre/domain/usecases/onboard/store_user_data.dart';
import 'package:ccalibre/presentation/widgets/dialog_animation_wrapper.dart';
import 'package:ccalibre/presentation/widgets/message_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  final StoreUserData _storeUserData;
  final GetUserData _getUserData;

  OnboardController({
    required StoreUserData storeUserData,
    required GetUserData getUserData,
  })  : _storeUserData = storeUserData,
        _getUserData = getUserData;

  late final TextEditingController controller;

  final tokenFile = Rx<File?>(null);
  final storedUser = Rx<User?>(null);
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    controller = TextEditingController();

    ever(storedUser, (updatedUser) {
      if (updatedUser != null) {
        Get.offAllNamed(Routes.homeRoute);
      } else {
        Get.toNamed(Routes.uploadTokenRoute);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();

    controller.dispose();
  }

  Future<void> storeTokenAndUsername() async {
    if (tokenFile.value == null) {
      // File is not selected. return.
      return;
    }

    final failureOrUser = await _storeUserData(Params(
        tokenFile: tokenFile.value, githubUsername: controller.text.trim()));

    failureOrUser.fold(
      (failure) {
        errorMessage.value = Helpers.convertFailureToString(failure);
      },
      (user) => storedUser.value = user,
    );
  }

  Future<void> getUserData() async {
    final failureOrUser = await _getUserData(NoParams());

    failureOrUser.fold(
      (failure) {
        errorMessage.value = Helpers.convertFailureToString(failure);
      },
      (user) => storedUser.value = user,
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

  Future<bool> pickTextFileFromDevice() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ['txt'],
        type: FileType.custom);

    if (result == null) {
      //File Dialog cancelled by user
      return false;
    }

    tokenFile.value = File(result.files.first.path!);

    return true;
  }
}
