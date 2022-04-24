import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/presentation/getx/build/controller.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/screens/home/widgets/build_item.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBuildsScreen extends StatelessWidget {
  final BuildController _buildController = Get.find<BuildController>();
  final HomeController _homeController = Get.find<HomeController>();

  AllBuildsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppScaffold(
      children: [
        const CustomTopBar(),
        SizedBox(height: 8.0.wp),
        SectionHeading(
          heading: 'All Builds',
          actionText: _homeController.storedUser.value!.githubUsername,
        ),
        SizedBox(height: 6.0.wp),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _buildController.allBuilds.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0.wp,
            mainAxisSpacing: 6.0.wp,
          ),
          itemBuilder: (_, index) {
            final build = _buildController.allBuilds[index];
            final timeDiff = Helpers.getBuildTimeFooter(
              build.status,
              build.startedAt,
              build.finishedAt,
            );
            final timeStatus =
                Helpers.getBuildHistoryFooterStatus(build.status);

            return RoundedCard(
              cardTitle: build.branch.toLowerCase(),
              footerText: '$timeStatus $timeDiff',
              cardBackgroundColor:
                  Helpers.getCardBackgroundColorByBuildStatus(build.status),
              cardBorderColor:
                  Helpers.getCardBorderColorByBuildStatus(build.status),
              centerChild: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${build.status}\n'.toUpperCase(),
                        style: textTheme.headline5!.copyWith(
                          color: primaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'with ${build.artefactsCount} artefacts',
                        style: textTheme.button!.copyWith(
                          color: primaryTextColor,
                          fontSize: 10.0.sp,
                          height: 1.2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
