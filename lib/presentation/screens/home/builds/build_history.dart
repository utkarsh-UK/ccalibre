import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/presentation/getx/build/controller.dart';
import 'package:ccalibre/presentation/screens/home/widgets/build_item.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/extensions.dart';

class BuildHistory extends StatelessWidget {
  final BuildController _buildController = Get.find<BuildController>();

  BuildHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SectionHeading(
          heading: 'Build History',
          actionText: 'view all',
        ),
        SizedBox(height: 6.0.wp),
        SizedBox(
          height: size.height * 0.25,
          child: Obx(
            () => ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _buildController.allBuilds.length,
              separatorBuilder: (_, __) => SizedBox(width: 5.0.wp),
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
          ),
        ),
      ],
    );
  }
}
