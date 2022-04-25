import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/domain/entities/workflow.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/getx/user/controller.dart';
import 'package:ccalibre/presentation/screens/home/widgets/build_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WorkflowsList extends StatelessWidget {
  final int totalBuilds;
  final int buildSuccessCount;
  final List<Workflow> workflows;

  const WorkflowsList({
    Key? key,
    required this.workflows,
    required this.totalBuilds,
    required this.buildSuccessCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: workflows.length,
        separatorBuilder: (_, __) => SizedBox(width: 5.0.wp),
        itemBuilder: (_, index) => InkWell(
          onTap: () => _onWorkflowClicked(index, context),
          child: RoundedCard(
            cardTitle: workflows[index].name,
            footerText: '$buildSuccessCount/$totalBuilds successful builds',
            footerIcon: FontAwesomeIcons.circleCheck,
            cardBorderColor: accentColor,
            cardBackgroundColor: cardBackgroundYellowColor,
            centerChild: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
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
                  FittedBox(
                    child: Text(
                      'Start New Build',
                      style: textTheme.headline6!.copyWith(
                        color: primaryButtonTextColor,
                        fontSize: 14.0.sp,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onWorkflowClicked(int index, BuildContext context) {
    final _homeController = Get.find<HomeController>();

    Get.find<UserController>().setSelectedWorkflowID(workflows[index].id);
    _homeController.showStartBuildSheet(
      context,
      _homeController.application.value!,
      shouldPresetWorkflow: true,
      workflowName: workflows[index].name,
    );
  }
}
