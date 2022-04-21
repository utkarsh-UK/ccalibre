import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/screens/home/controller.dart';
import 'package:ccalibre/presentation/screens/home/widgets/build_item.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/extensions.dart';

class BuildHistory extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

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
              itemCount: _homeController.builds.length,
              separatorBuilder: (_, __) => SizedBox(width: 5.0.wp),
              itemBuilder: (_, index) {
                final build = _homeController.builds[index];
                final isFinished = build.status == 'finished';
                final timeDiff = isFinished
                    ? build.finishedAt.timeAgo()
                    : build.startedAt.timeAgo();
                final timeStatus = isFinished ? 'Finished' : 'Started';

                return RoundedCard(
                  cardTitle: build.branch.toLowerCase(),
                  footerText: '$timeStatus $timeDiff ago',
                  centerChild: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${build.status}\n'.toUpperCase(),
                            style: textTheme.headline5!.copyWith(
                              color: isFinished ? logoRedColor : logoGreenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'with 2 artefacts',
                            style: textTheme.button!.copyWith(
                              color: isFinished ? logoRedColor : logoGreenColor,
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
