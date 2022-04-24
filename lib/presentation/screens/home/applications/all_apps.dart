import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/screens/home/widgets/app_tile.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAppsScreen extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  AllAppsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      children: [
        const CustomTopBar(),
        SizedBox(height: 8.0.wp),
        SectionHeading(
          heading: 'All Applications',
          actionText: _homeController.storedUser.value!.githubUsername,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _homeController.applications.length,
          separatorBuilder: (_, __) =>
              const Divider(color: Color(0xFF16182C), thickness: 1.2),
          itemBuilder: (_, index) => AppTile(
            application: _homeController.applications[index],
          ),
        ),
      ],
    );
  }
}
