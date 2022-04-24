import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/routes.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/getx/user/controller.dart';
import 'package:ccalibre/presentation/screens/home/applications/applications.dart';
import 'package:ccalibre/presentation/screens/home/builds/build_history.dart';
import 'package:ccalibre/presentation/screens/home/widgets/empty_apps.dart';
import 'package:ccalibre/presentation/screens/home/widgets/live_build_status.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/secondary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(() {
      final bool isBuildInProgress = _homeController.isBuildInProgress.value;
      final bool areApplicationsAdded =
          _homeController.areApplicationsAdded.value;

      return AppScaffold(
        children: [
          const CustomTopBar(),
          SizedBox(height: 8.0.wp),
          isBuildInProgress ? const LiveBuildStatus() : const SizedBox.shrink(),
          isBuildInProgress
              ? SizedBox(height: 8.0.wp)
              : const SizedBox.shrink(),
          areApplicationsAdded ? Applications() : const EmptyApps(),
          areApplicationsAdded
              ? SizedBox(height: 6.0.wp)
              : const SizedBox.shrink(),
          areApplicationsAdded ? BuildHistory() : const SizedBox.shrink(),
          SizedBox(height: 6.0.wp),
          areApplicationsAdded
              ? const SizedBox.shrink()
              : Center(
                  child: SizedBox(
                    width: size.width * 0.9,
                    height: 50.0.hp,
                    child: Lottie.asset('assets/anim/empty_apps.json'),
                  ),
                ),
          SizedBox(height: 6.0.wp),
          areApplicationsAdded
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0.wp),
                  child: SecondaryActionButton(
                    label: 'Create New Application',
                    onClick: () {
                      final _userController = Get.find<UserController>();
                      _userController.getPublicRepositories(
                        _homeController.storedUser.value!.githubUsername,
                      );

                      _homeController.showAddApplicationSheet(context);
                    },
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0.wp),
                  child: SecondaryActionButton(
                    label: 'View Repositories',
                    onClick: () {
                      Get.find<UserController>().getPublicRepositories(
                          _homeController.storedUser.value!.githubUsername);
                      Get.toNamed(Routes.allReposRoute);
                    },
                  ),
                ),
        ],
      );
    });
  }
}
