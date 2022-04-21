import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedCard extends StatelessWidget {
  final String cardTitle;
  final IconData titleIcon;
  final String footerText;
  final IconData footerIcon;
  final Widget centerChild;
  final Color cardBorderColor;
  final Color cardBackgroundColor;

  const RoundedCard({
    Key? key,
    required this.cardTitle,
    this.titleIcon = FontAwesomeIcons.codeBranch,
    required this.footerText,
    this.footerIcon = FontAwesomeIcons.clock,
    required this.centerChild,
    this.cardBorderColor = logoRedColor,
    this.cardBackgroundColor = cardBackgroundRedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: size.height * 0.25,
      width: size.width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 0.5.wp),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        border: Border.all(
          color: cardBorderColor,
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
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: FaIcon(
              titleIcon,
              size: 4.0.wp,
              color: iconColor,
            ),
            label: Text(
              cardTitle,
              style: textTheme.button!.copyWith(fontSize: 12.0.sp),
            ),
          ),
          centerChild,
          Flexible(
            child: TextButton.icon(
              onPressed: null,
              style: TextButton.styleFrom(),
              icon: FaIcon(
                footerIcon,
                size: 4.0.wp,
                color: iconColor,
              ),
              label: FittedBox(
                child: Text(
                  footerText,
                  style: textTheme.button!.copyWith(
                    fontSize: 10.0.sp,
                    color: const Color(0xFF4A4A4A),
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
