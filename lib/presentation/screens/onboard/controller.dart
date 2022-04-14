import 'package:ccalibre/presentation/widgets/dialog_animation_wrapper.dart';
import 'package:ccalibre/presentation/widgets/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  late final TextEditingController controller;

  @override
  void onInit() {
    super.onInit();

    controller = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    controller.dispose();
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
}
