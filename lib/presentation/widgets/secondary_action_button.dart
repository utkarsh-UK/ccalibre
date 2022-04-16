import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class SecondaryActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onClick;

  const SecondaryActionButton({
    Key? key,
    required this.label,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onClick,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.only(
            right: 4.0.wp,
            top: 3.0.wp,
            bottom: 3.0.wp,
            left: 4.0.wp,
          ),
          side: const BorderSide(color: primaryColor, width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: Text(
          label,
          style: textTheme.button!.copyWith(color: primaryTextColor),
        ),
      ),
    );
  }
}
