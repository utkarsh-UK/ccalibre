import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrimaryActionButton extends StatelessWidget {
  final IconData? iconData;
  final String label;
  final VoidCallback? onClick;

  const PrimaryActionButton({
    Key? key,
    this.iconData,
    required this.label,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: onClick,
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          padding: EdgeInsets.only(
            right: 4.0.wp,
            top: 3.0.wp,
            bottom: 3.0.wp,
            left: 0.0.wp,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(iconData == null ? 20.0 : 12.0),
          ),
        ),
        icon: iconData == null
            ? const SizedBox.shrink()
            : Container(
                margin: EdgeInsets.only(right: 6.0.wp),
                child: FaIcon(
                  iconData,
                  size: 4.5.wp,
                  color: primaryButtonTextColor,
                ),
              ),
        label: Text(
          label,
          style: textTheme.button!.copyWith(color: primaryButtonTextColor),
        ),
      ),
    );
  }
}
