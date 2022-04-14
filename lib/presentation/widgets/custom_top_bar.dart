import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/extensions.dart';

class CustomTopBar extends StatelessWidget {
  final bool showMainBar;
  final double iconSize = 8.0;
  final bool isRightChildShown;
  final bool isLeftChildShown;

  const CustomTopBar({
    Key? key,
    this.showMainBar = true,
    this.isRightChildShown = true,
    this.isLeftChildShown = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: showMainBar
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(
              horizontal: 5.0.wp,
              vertical: 3.0.wp,
            ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            showMainBar ? _buildMainBar(textTheme) : _buildUploadTokenIcons(),
      ),
    );
  }

  List<Widget> _buildMainBar(TextTheme textTheme) {
    return [
      Text(
        Constants.appName,
        style: textTheme.headline3!.copyWith(color: accentColor),
      ),
      InkWell(
        onTap: null,
        child: FaIcon(
          FontAwesomeIcons.gear,
          color: iconColor,
          size: iconSize.wp,
        ),
      )
    ];
  }

  List<Widget> _buildUploadTokenIcons() {
    return [
      isLeftChildShown
          ? InkWell(
              onTap: null,
              child: FaIcon(
                FontAwesomeIcons.leftLong,
                color: iconColor,
                size: iconSize.wp,
              ),
            )
          : const SizedBox.shrink(),
      isRightChildShown
          ? InkWell(
              onTap: null,
              child: FaIcon(
                FontAwesomeIcons.xmark,
                color: accentColor,
                size: iconSize.wp,
              ),
            )
          : const SizedBox.shrink(),
    ];
  }
}
