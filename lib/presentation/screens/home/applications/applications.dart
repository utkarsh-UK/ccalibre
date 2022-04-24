import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/routes.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/screens/home/widgets/app_tile.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Applications extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  final bool isHeadingShown;

  Applications({Key? key, this.isHeadingShown = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (isHeadingShown)
            SectionHeading(
              heading: 'Applications (${_homeController.applications.length})',
              actionText: 'view all',
              onActionTap: () => Get.toNamed(Routes.allAppsRoute),
            ),
          SizedBox(height: 6.0.wp),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _homeController.applications.length > 4
                ? 5
                : _homeController.applications.length,
            separatorBuilder: (_, __) =>
                const Divider(color: Color(0xFF16182C), thickness: 1.2),
            itemBuilder: (_, index) => AppTile(
              application: _homeController.applications[index],
            ),
          ),
        ],
      ),
    );
  }
}
