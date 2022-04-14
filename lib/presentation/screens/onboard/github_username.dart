import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/presentation/screens/home/view.dart';
import 'package:ccalibre/presentation/screens/onboard/controller.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/screens/onboard/widgets/onboard_scaffold.dart';
import 'package:ccalibre/presentation/widgets/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';

class GithubUsername extends StatelessWidget {
  final OnboardController onboardController = Get.find<OnboardController>();

  GithubUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return OnboardScaffold(
      children: [
        const CustomTopBar(isRightChildShown: false, showMainBar: false),
        SizedBox(height: 2.0.wp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
          child: Text('GitHub Username', style: textTheme.headline3),
        ),
        SizedBox(height: 16.0.wp),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Enter GitHub Username',
            style: textTheme.headline3!.copyWith(
              color: accentColor,
            ),
          ),
        ),
        SizedBox(height: 16.0.wp),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 8.0.wp,
              vertical: 8.0.wp,
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Provide your GitHub username to fetch public repositories.',
                    style: textTheme.subtitle2,
                  ),
                  SizedBox(height: 4.0.wp),
                  TextField(
                    controller: onboardController.controller,
                    style: textTheme.headline6,
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: backgroundColor,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 5.0.wp,
                        vertical: 2.0.wp,
                      ),
                      hintText: 'Username',
                      hintStyle: textTheme.subtitle1,
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
                  ),
                  const Spacer(),
                  PrimaryActionButton(
                    iconData: FontAwesomeIcons.locationArrow,
                    label: 'Go to Home',
                    onClick: _redirectToHome,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _redirectToHome() {
    Get.to(() => const HomeScreen());
  }
}
