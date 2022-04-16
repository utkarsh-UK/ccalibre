import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/widgets/dropdown_input.dart';
import 'package:ccalibre/presentation/widgets/primary_action_button.dart';
import 'package:ccalibre/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<String> _workflows = [
  'Select Workflow',
  'Workflow-1',
  'Workflow-2',
  'Workflow-3',
  'Workflow-4',
];

const List<String> _branches = [
  'Select Branch',
  'master',
  'dev',
  'preprod',
  'prod',
];

class StartBuildSheet extends StatelessWidget {
  const StartBuildSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.wp, vertical: 3.0.wp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Start New Build',
              style: textTheme.headline4!.copyWith(fontSize: 16.0.sp),
            ),
          ),
          SizedBox(height: 4.0.wp),
          const DropdownInput(values: _workflows),
          SizedBox(height: 4.0.wp),
          const DropdownInput(values: _branches),
          SizedBox(height: 4.0.wp),
          Text(
            'Add environment variables (Optional)',
            style: textTheme.bodyText2!.copyWith(fontSize: 14.0.sp),
          ),
          SizedBox(height: 3.0.wp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(child: TextInputField()),
              SizedBox(width: 4.0.wp),
              const Flexible(child: TextInputField()),
              SizedBox(width: 4.0.wp),
              OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: primaryColor, width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.0.wp,
                    vertical: 0.5.wp,
                  ),
                ),
                child: Text(
                  'Add',
                  style: textTheme.subtitle2!.copyWith(color: primaryTextColor),
                ),
              )
            ],
          ),
          SizedBox(height: 6.0.wp),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: const PrimaryActionButton(
                label: 'Start Build',
                iconData: FontAwesomeIcons.plus,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
