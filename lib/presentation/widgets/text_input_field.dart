import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      // controller: controller,
      style: textTheme.bodyText2!.copyWith(
        fontSize: 12.0.sp,
        color: primaryTextColor,
      ),
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        filled: false,
        hintText: 'Key',
        hintStyle: textTheme.bodyText2!.copyWith(fontSize: 12.0.sp),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 1.0.wp),
        enabled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF707070),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF707070),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF707070),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
      ),
    );
  }
}
