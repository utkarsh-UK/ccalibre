import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyApps extends StatelessWidget {
  const EmptyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 4.0.wp,
        vertical: 6.0.wp,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, utkarsh-UK',
                style: textTheme.subtitle2!.copyWith(
                  color: primaryButtonTextColor,
                ),
              ),
              SizedBox(height: 4.0.wp),
              Text(
                'You have not setup applications.\nLet\'s do your workflow management',
                style: textTheme.headline6!.copyWith(
                  color: primaryButtonTextColor,
                  fontSize: 12.0.sp,
                ),
                softWrap: true,
              ),
            ],
          ),
          CircleAvatar(
            radius: 8.0.wp,
            backgroundColor: Colors.white,
            child: const FaIcon(
              FontAwesomeIcons.angleRight,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
