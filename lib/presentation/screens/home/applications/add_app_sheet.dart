import 'package:ccalibre/core/utils/constants.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/widgets/dropdown_input.dart';
import 'package:ccalibre/presentation/widgets/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<String> _repositories = [
  'Select Repository',
  'persuit-mobile',
  'persuit',
  'ccalibre',
  'fiscal',
  'health-checkup'
];

class AddAppSheet extends StatelessWidget {
  const AddAppSheet({Key? key}) : super(key: key);

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
              'Add Application',
              style: textTheme.headline4!.copyWith(fontSize: 16.0.sp),
            ),
          ),
          SizedBox(height: 4.0.wp),
          Text(
            'Select Repository',
            style: textTheme.bodyText2!.copyWith(fontSize: 14.0.sp),
          ),
          SizedBox(height: 3.0.wp),
          const DropdownInput(values: _repositories),
          SizedBox(height: 6.0.wp),
          Text(
            Constants.addYamlFileNote,
            style: textTheme.subtitle2!.copyWith(
              fontSize: 10.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.0.wp),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: const PrimaryActionButton(
                label: 'Add Application',
                iconData: FontAwesomeIcons.plus,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
