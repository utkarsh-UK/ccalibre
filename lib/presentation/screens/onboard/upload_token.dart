import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/constants.dart';
import 'package:ccalibre/core/utils/routes.dart';
import 'package:ccalibre/presentation/screens/onboard/controller.dart';
import 'package:ccalibre/presentation/screens/onboard/widgets/onboard_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/primary_action_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';

class UploadToken extends StatelessWidget {
  const UploadToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return OnboardScaffold(
      children: [
        const CustomTopBar(isLeftChildShown: false, showMainBar: false),
        SizedBox(height: 2.0.wp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
          child: Text('Upload API Token', style: textTheme.headline3),
        ),
        SizedBox(height: 16.0.wp),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Let\'s Get Started',
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
                    Constants.onboardTokenDescription1,
                    style: textTheme.subtitle2,
                  ),
                  SizedBox(height: 4.0.wp),
                  Text(
                    Constants.onboardTokenDescription2,
                    style: textTheme.subtitle2,
                  ),
                  SizedBox(height: 4.0.wp),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Constants.onboardTokenDescription3,
                          style: textTheme.subtitle2,
                        ),
                        TextSpan(
                          text: ' click here',
                          style: textTheme.button!.copyWith(
                            color: primaryColor,
                            fontSize: 12.0.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0.wp,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.fileLines,
                          size: 5.0.wp,
                          color: iconColor,
                        ),
                        SizedBox(width: 4.0.wp),
                        Text(
                          'No file chosen',
                          style: textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.0.wp),
                  PrimaryActionButton(
                    iconData: FontAwesomeIcons.upload,
                    label: 'Choose File',
                    onClick: () => _onFileChoseClick(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onFileChoseClick(BuildContext context) {
    final controller = Get.find<OnboardController>();

    controller.pickTextFileFromDevice().then((shallProceed) {
      if (shallProceed) {
        controller.showDialog(
            context: context,
            title: 'Token Retrieved',
            primaryBtnText: 'Next',
            message:
                'Your token will be stored securely in this device. If you uninstall the application, token will also get deleted. Click Next to proceed.',
            onPrimaryBtnClick: () {
              Get.back();
              Get.toNamed(Routes.githubUsernameRoute);
            });
      }
    });
  }
}
