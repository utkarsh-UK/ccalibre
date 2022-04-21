import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/screens/home/controller.dart';
import 'package:ccalibre/presentation/screens/home/applications/applications.dart';
import 'package:ccalibre/presentation/screens/home/builds/build_history.dart';
import 'package:ccalibre/presentation/screens/home/widgets/empty_apps.dart';
import 'package:ccalibre/presentation/screens/home/widgets/live_build_status.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/secondary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      children: [
        const CustomTopBar(),
        SizedBox(height: 8.0.wp),
        Obx(
          () => _homeController.isBuildInProgress.value
              ? const LiveBuildStatus()
              : const SizedBox.shrink(),
        ),
        SizedBox(height: 8.0.wp),
        Obx(
          () => _homeController.areApplicationsAdded.value
              ? Applications()
              : const EmptyApps(),
        ),
        SizedBox(height: 6.0.wp),
        Obx(
          () => _homeController.areApplicationsAdded.value
              ?  BuildHistory()
              : const EmptyApps(),
        ),
        SizedBox(height: 6.0.wp),
        Obx(
          () => _homeController.areApplicationsAdded.value
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0.wp),
                  child: SecondaryActionButton(
                    label: 'Create New Application',
                    onClick: () =>
                        _homeController.showAddApplicationSheet(context),
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0.wp),
                  child:
                      const SecondaryActionButton(label: 'View Repositories'),
                ),
        ),
      ],
    );
  }
}
