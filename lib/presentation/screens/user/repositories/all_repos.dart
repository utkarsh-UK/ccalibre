import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/getx/user/controller.dart';
import 'package:ccalibre/presentation/screens/user/widgets/repo_tile.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllReposScreen extends StatelessWidget {
  final UserController _userController = Get.find<UserController>();
  final HomeController _homeController = Get.find<HomeController>();

  AllReposScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      children: [
        const CustomTopBar(),
        SizedBox(height: 8.0.wp),
        SectionHeading(
          heading: 'All Repositories',
          actionText: _homeController.storedUser.value!.githubUsername,
        ),
        SizedBox(height: 6.0.wp),
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _userController
                .repositories
                // .where((repo) => !_homeController.applications
                //     .any((app) => app.repositoryURL == repo.url))
                .length,
            separatorBuilder: (_, __) =>
                const Divider(color: Color(0xFF16182C), thickness: 1.2),
            itemBuilder: (_, index) => RepoTile(
              repository: _userController.repositories[index],
            ),
          ),
        ),
      ],
    );
  }
}
