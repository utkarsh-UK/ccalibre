import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/screens/home/controller.dart';
import 'package:ccalibre/presentation/screens/home/widgets/build_item.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ApplicationDetails extends StatelessWidget {
  const ApplicationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return AppScaffold(
      children: [
        const CustomTopBar(),
        SizedBox(height: 8.0.wp),
        Text(
          'Persuit-Mobile',
          style: textTheme.headline5,
        ),
        SizedBox(height: 6.0.wp),
        _buildBranchesChips(textTheme),
        SizedBox(height: 6.0.wp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInfoWithIcon(
              textTheme: textTheme,
              title: 'Workflows',
              value: '3',
              icon: FontAwesomeIcons.atom,
            ),
            _buildInfoWithIcon(
              textTheme: textTheme,
              title: 'Total Builds',
              value: '3 builds',
              icon: FontAwesomeIcons.wrench,
            ),
          ],
        ),
        SizedBox(height: 6.0.wp),
        const SectionHeading(heading: 'Workflows', actionText: null),
        SizedBox(height: 6.0.wp),
        _buildWorkflowsList(size, textTheme),
        SizedBox(height: 6.0.wp),
        const SectionHeading(heading: 'Variables', actionText: 'Add New'),
        SizedBox(height: 6.0.wp),
        _buildVariable(textTheme, context),
        SizedBox(height: 6.0.wp),
        const SectionHeading(heading: 'Builds', actionText: 'Start New'),
        SizedBox(height: 6.0.wp),
        _createBuildInfoTile(textTheme),
        _createBuildInfoTile(textTheme),
      ],
    );
  }

  Widget _createBuildInfoTile(TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.0.wp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                'Build run on Workflow-1',
                style: textTheme.headline6!.copyWith(
                  fontSize: 14.0.sp,
                ),
              ),
              Text(
                'Finished in 5m 48s',
                style: textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              Text(
                'Run Again',
                style: textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Apr 4th\n10:00 AM',
              style: textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVariable(TextTheme textTheme, BuildContext context) {
    return Row(
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
              'Variable 1',
              style: textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.0.sp,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => Get.find<HomeController>().showUpdateVarSheet(context),
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
    );
  }

  Widget _buildWorkflowsList(Size size, TextTheme textTheme) {
    return SizedBox(
      height: size.height * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (_, __) => SizedBox(width: 5.0.wp),
        itemBuilder: (_, index) => RoundedCard(
          cardTitle: 'Workflow-1',
          footerText: '3/5 successful builds',
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

  Widget _buildBranchesChips(TextTheme textTheme) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 1.0.wp,
      spacing: 4.0.wp,
      children: List<Widget>.generate(
          5,
          (index) => Chip(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.0.wp,
                  vertical: 1.2.wp,
                ),
                label: Text(
                  'master',
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