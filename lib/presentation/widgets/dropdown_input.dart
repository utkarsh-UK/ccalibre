import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownInput extends StatelessWidget {
  final List<String> values;
  final Function(String?)? onDropdownChanged;

  const DropdownInput({
    Key? key,
    required this.values,
    this.onDropdownChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    debugPrint('$values');

    return DropdownButtonFormField<String>(
      value: values.first,
      onChanged: onDropdownChanged,
      items: values
          .map<DropdownMenuItem<String>>((item) => DropdownMenuItem(
                child: Text(item),
                value: item,
              ))
          .toList(),
      style: textTheme.bodyText2!.copyWith(
        color: primaryTextColor,
        fontSize: 12.0.sp,
      ),
      icon: FaIcon(
        FontAwesomeIcons.caretDown,
        size: 6.0.wp,
        color: iconColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: borderColor,
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.symmetric(vertical: 1.0.wp, horizontal: 4.0.wp),
        focusedBorder: InputBorder.none,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
      ),
    );
  }
}
