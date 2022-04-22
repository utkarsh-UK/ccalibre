import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/core/utils/helpers.dart';
import 'package:ccalibre/domain/entities/build.dart';
import 'package:ccalibre/domain/entities/variable.dart';
import 'package:ccalibre/domain/entities/workflow.dart';
import 'package:ccalibre/presentation/getx/build/controller.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/getx/user/controller.dart';
import 'package:ccalibre/presentation/screens/home/widgets/build_item.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ApplicationDetails extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();
  final BuildController _buildController = Get.find<BuildController>();

  ApplicationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Obx(() => _loadWidget(context, size, textTheme));
  }

  Widget _loadWidget(BuildContext context, Size size, TextTheme textTheme) {
    final bool checker = _homeController.isSelectedAppLoading.value;

    switch (checker) {
      case true:
        return const AppScaffold(
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        );
      case false:
        return WillPopScope(
          onWillPop: () async {
            _homeController.resetCurrentApplication();
            return true;
          },
          child: Obx(
            () => AppScaffold(
              children: [
                const CustomTopBar(),
                SizedBox(height: 8.0.wp),
                Text(
                  _homeController.application.value!.name,
                  style: textTheme.headline5,
                ),
                SizedBox(height: 6.0.wp),
                _buildBranchesChips(
                  textTheme,
                  _homeController.application.value!.branches,
                ),
                SizedBox(height: 6.0.wp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoWithIcon(
                      textTheme: textTheme,
                      title: 'Workflows',
                      value:
                          '${_homeController.application.value!.workflows.length}',
                      icon: FontAwesomeIcons.atom,
                    ),
                    _buildInfoWithIcon(
                      textTheme: textTheme,
                      title: 'Total Builds',
                      value:
                          '${_buildController.applicationBuilds.length} builds',
                      icon: FontAwesomeIcons.wrench,
                    ),
                  ],
                ),
                SizedBox(height: 6.0.wp),
                const SectionHeading(heading: 'Workflows', actionText: null),
                SizedBox(height: 6.0.wp),
                _buildWorkflowsList(
                  context,
                  size,
                  textTheme,
                  _homeController.application.value!.workflows,
                ),
                SizedBox(height: 6.0.wp),
                const SectionHeading(
                  heading: 'Variables',
                  actionText: 'Add New',
                ),
                SizedBox(height: 6.0.wp),
                _buildVariable(
                  textTheme,
                  context,
                  _homeController.application.value!.variables,
                ),
                SizedBox(height: 6.0.wp),
                const SectionHeading(
                  heading: 'Builds',
                  actionText: 'Start New',
                ),
                SizedBox(height: 6.0.wp),
                ..._buildController.applicationBuilds
                    .map<Widget>(
                        (build) => _createBuildInfoTile(textTheme, build))
                    .toList(),
              ],
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _createBuildInfoTile(TextTheme textTheme, Build build) {
    final workflowName = _homeController.application.value!.workflows
        .firstWhere((work) => work.id == build.workflowID)
        .name;

    return Padding(
      padding: EdgeInsets.only(bottom: 6.0.wp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 8.0.wp,
            backgroundColor: iconBackgroundColor,
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.wrench,
                color: primaryColor,
                size: 7.0.wp,
              ),
            ),
          ),
          SizedBox(width: 4.0.wp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Build run on $workflowName',
                style: textTheme.headline6!.copyWith(
                  fontSize: 14.0.sp,
                ),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${Helpers.getBuildStatus(build.status)}5m 48s',
                style: textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              Text(
                Helpers.getBuildActionButtonText(build.status),
                style: textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Helpers.getBuildActionButtonColor(build.status),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Apr 4th\n10:00 AM',
              style: textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 10.0.sp,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVariable(
    TextTheme textTheme,
    BuildContext context,
    List<Variable> variables,
  ) {
    return variables.isEmpty
        ? Align(
            alignment: Alignment.center,
            child: Text(
              'No variables added. Create one.',
              style: textTheme.subtitle2,
            ),
          )
        : Column(
            children: variables
                .map<Widget>((variable) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 3.0.wp),
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.0.wp,
                              vertical: 3.0.wp,
                            ),
                            color: borderColor,
                            child: Text(
                              variable.variableKey,
                              style: textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0.sp,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.find<HomeController>()
                              .showUpdateVarSheet(context),
                          child: Container(
                            margin: EdgeInsets.only(right: 3.0.wp),
                            padding: EdgeInsets.all(3.0.wp),
                            decoration: BoxDecoration(
                              color: borderColor,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.pen,
                              size: 6.0.wp,
                              color: accentColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(3.0.wp),
                          decoration: BoxDecoration(
                            color: borderColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.trash,
                            size: 6.0.wp,
                            color: logoRedColor,
                          ),
                        ),
                      ],
                    ))
                .toList(),
          );
  }

  Widget _buildWorkflowsList(
    BuildContext context,
    Size size,
    TextTheme textTheme,
    List<Workflow> workflows,
  ) {
    final int totalBuilds = _buildController.applicationBuilds.length;
    final int buildSuccessCount = _buildController.applicationBuilds
        .where((build) => build.status == 'finished')
        .length;

    return SizedBox(
      height: size.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: workflows.length,
        separatorBuilder: (_, __) => SizedBox(width: 5.0.wp),
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            Get.find<UserController>()
                .setSelectedWorkflowID(workflows[index].id);
            _homeController.showStartBuildSheet(
              context,
              _homeController.application.value!,
              shouldPresetWorkflow: true,
              workflowName: workflows[index].name,
            );
          },
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

  Widget _buildInfoWithIcon({
    required TextTheme textTheme,
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(3.5.wp),
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: FaIcon(
            icon,
            color: primaryColor,
            size: 6.0.wp,
          ),
        ),
        SizedBox(width: 3.0.wp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.subtitle1!.copyWith(
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              value,
              style: textTheme.headline6!.copyWith(
                fontSize: 12.0.sp,
                height: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBranchesChips(TextTheme textTheme, List<String> branches) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 1.0.wp,
      spacing: 4.0.wp,
      children: List<Widget>.generate(
          branches.length,
          (index) => Chip(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.0.wp,
                  vertical: 1.2.wp,
                ),
                label: Text(
                  branches[index],
                  style: textTheme.headline6!.copyWith(fontSize: 12.0.sp),
                ),
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: primaryColor,
                  width: 1.2,
                ),
              )).toList(),
    );
  }
}
