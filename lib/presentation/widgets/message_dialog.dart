import 'package:ccalibre/presentation/widgets/primary_action_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/extensions.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String message;
  final String primaryBtnText;
  final VoidCallback? onPrimaryButtonClick;

  const MessageDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.primaryBtnText,
    this.onPrimaryButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SimpleDialog(
      backgroundColor: Colors.white,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.0.wp,
            vertical: 3.0.wp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: textTheme.headline4),
              SizedBox(height: 6.0.wp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                child: Text(
                  message,
                  style: textTheme.subtitle2,
                ),
              ),
              SizedBox(height: 6.0.wp),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
                child: PrimaryActionButton(
                  label: primaryBtnText,
                  onClick: onPrimaryButtonClick,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
