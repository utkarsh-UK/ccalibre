import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildHistory extends StatelessWidget {
  const BuildHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Build History',
              style: textTheme.headline5,
            ),
            Text(
              'view all',
              style: textTheme.subtitle2!.copyWith(
                color: bodyTextColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0.wp),
        SizedBox(
          height: size.height * 0.25,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (_, __) => SizedBox(width: 5.0.wp),
            itemBuilder: (_, index) => const BuildHistoryItem(),
          ),
        ),
      ],
    );
  }
}

class BuildHistoryItem extends StatelessWidget {
  const BuildHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: size.height * 0.25,
      width: size.width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 0.5.wp),
      decoration: BoxDecoration(
        color: cardBackgroundRedColor,
        border: Border.all(
          color: logoRedColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: null,
            style: TextButton.styleFrom(),
            icon: FaIcon(
              FontAwesomeIcons.codeBranch,
              size: 4.0.wp,
              color: iconColor,
            ),
            label: Text(
              'develop',
              style: textTheme.button!.copyWith(fontSize: 12.0.sp),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'FAILED\n'.toUpperCase(),
                    style: textTheme.headline5!.copyWith(
                      color: logoRedColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'with 2 artefacts',
                    style: textTheme.button!.copyWith(
                      color: logoRedColor,
                      fontSize: 12.0.sp,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton.icon(
            onPressed: null,
            style: TextButton.styleFrom(),
            icon: FaIcon(
              FontAwesomeIcons.clock,
              size: 4.0.wp,
              color: iconColor,
            ),
            label: FittedBox(
              child: Text(
                'Started 5m 48s ago',
                style: textTheme.button!.copyWith(
                  fontSize: 10.0.sp,
                  color: const Color(0xFF4A4A4A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
