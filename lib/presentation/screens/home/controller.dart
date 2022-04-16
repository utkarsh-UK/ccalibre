import 'package:ccalibre/presentation/screens/home/applications/add_app_sheet.dart';
import 'package:ccalibre/presentation/screens/home/applications/start_build_sheet.dart';
import 'package:ccalibre/presentation/screens/home/applications/update_var_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final areApplicationsAdded = true.obs;
  final isBuildInProgress = true.obs;
  final applications = [].obs;

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
