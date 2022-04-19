import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/routes.dart';
import 'package:ccalibre/presentation/screens/home/controller.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Applications extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  final bool isHeadingShown;

  Applications({Key? key, this.isHeadingShown = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Column(
        children: [
          if (isHeadingShown)
            SectionHeading(
              heading: 'Applications (${_homeController.applications.length})',
              actionText: 'view all',
            ),
          SizedBox(height: 6.0.wp),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _homeController.applications.length,
            separatorBuilder: (_, __) =>
                const Divider(color: Color(0xFF16182C), thickness: 1.2),
            itemBuilder: (_, index) => ListTile(
              onTap: () => Get.toNamed(Routes.applicationDetailsRoute),
              title: Text(
                _homeController.applications[index].name,
                style: textTheme.headline6!.copyWith(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${_homeController.applications[index].workflows.length} workflows',
                style: textTheme.subtitle2!.copyWith(
                  fontSize: 12.0.sp,
                  height: 2.0,
                ),
              ),
              trailing: InkWell(
                onTap: () => _homeController.showStartBuildSheet(context),
                child: CircleAvatar(
                  radius: 6.0.wp,
                  backgroundColor: accentColor,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: 5.0.wp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
