import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/routes.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/presentation/getx/build/controller.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppTile extends StatelessWidget {
  final Application application;

  const AppTile({Key? key, required this.application}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      onTap: () => _onAppClick(application.id),
      title: Text(
        application.name,
        style: textTheme.headline6!.copyWith(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${application.workflows.length} workflows',
        style: textTheme.subtitle2!.copyWith(
          fontSize: 12.0.sp,
          height: 2.0,
        ),
      ),
      trailing: InkWell(
        onTap: () => Get.find<HomeController>().showStartBuildSheet(
          context,
          application,
        ),
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
    );
  }

  void _onAppClick(String appID) {
    Get.find<HomeController>().getApplication(appID);
    Get.find<BuildController>().getBuildsForApplication(appID);
    Get.toNamed(Routes.applicationDetailsRoute);
  }
}
