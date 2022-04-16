import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class LiveBuildStatus extends StatelessWidget {
  const LiveBuildStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 4.0.wp,
        vertical: 3.0.wp,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          _buildCardTitle(textTheme),
          SizedBox(height: 6.0.wp),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your build is currently in\n',
                  style: textTheme.subtitle2!.copyWith(
                    color: cardTitleLightColor,
                  ),
                ),
                TextSpan(
                  text: 'Building\n',
                  style: textTheme.headline5!.copyWith(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600,
                    color: primaryButtonTextColor,
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: 'stage',
                  style: textTheme.subtitle2!.copyWith(
                    color: cardTitleLightColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6.0.wp),
          _buildCardFooter(textTheme),
        ],
      ),
    );
  }

  Widget _buildCardFooter(TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Started at\n23rd Dec 2022 10:00 PM',
          style: textTheme.subtitle2!.copyWith(
            color: cardTitleLightColor,
            fontSize: 10.0.sp,
          ),
        ),
        Text(
          'Cancel Build',
          style: textTheme.headline6!.copyWith(
            color: primaryButtonTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCardTitle(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Build Status',
          style: textTheme.subtitle2!.copyWith(
            color: cardTitleLightColor,
            fontSize: 12.0.sp,
          ),
        ),
        Text(
          'Counter App',
          style: textTheme.headline6!.copyWith(
            color: cardTitleLightColor,
          ),
        ),
        Text(
          'Place',
          style: textTheme.headline6!.copyWith(
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
