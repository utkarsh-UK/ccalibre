import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/widgets/primary_action_button.dart';
import 'package:ccalibre/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateVarSheet extends StatelessWidget {
  const UpdateVarSheet({Key? key}) : super(key: key);

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
              'Update Variable',
              style: textTheme.headline4!.copyWith(fontSize: 16.0.sp),
            ),
          ),
          SizedBox(height: 4.0.wp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.0.wp,
                    vertical: 3.0.wp,
                  ),
                  color: borderColor,
                  child: Text(
                    'Variable 1',
                    style: textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 4.0.wp),
              const Flexible(child: TextInputField()),
            ],
          ),
          SizedBox(height: 6.0.wp),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: const PrimaryActionButton(
                label: 'Update',
                iconData: FontAwesomeIcons.check,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
