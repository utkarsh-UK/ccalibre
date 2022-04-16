import 'package:ccalibre/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String heading;
  final String? actionText;

  const SectionHeading({
    Key? key,
    required this.heading,
    required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: textTheme.headline5,
        ),
        if (actionText != null)
          Text(
            actionText ?? 'view all',
            style: textTheme.subtitle2!.copyWith(
              color: bodyTextColor,
            ),
          ),
      ],
    );
  }
}
