import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/getx/onboard/controller.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/primary_action_button.dart';
import 'package:ccalibre/presentation/widgets/secondary_action_button.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final token = _homeController.token.value;

    return WillPopScope(
      onWillPop: () async {
        _homeController.usernameController.clear();
        return true;
      },
      child: AppScaffold(
        children: [
          CustomTopBar(
            mainBarIcon: FontAwesomeIcons.arrowLeftLong,
            onMainBarIconClick: Get.back,
          ),
          SizedBox(height: 3.0.wp),
          const SectionHeading(
            heading: 'GitHub Username',
            actionText: '',
          ),
          SizedBox(height: 6.0.wp),
          _buildUsernameField(textTheme),
          const SectionHeading(
            heading: 'Codemagic Token',
            actionText: '',
          ),
          SizedBox(height: 6.0.wp),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 2.0.wp),
            color: borderColor,
            child: Text(
              token.replaceRange(3, token.length - 3, '*' * (token.length - 6)),
              style: textTheme.bodyText2!.copyWith(
                fontSize: 12.0.sp,
                color: primaryTextColor,
              ),
            ),
          ),
          SizedBox(height: 6.0.wp),
          PrimaryActionButton(
            iconData: FontAwesomeIcons.upload,
            label: 'Upload Another Token',
            onClick: () => _onUploadTokenClicked(context),
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameField(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: TextFormField(
            controller: _homeController.usernameController,
            style: textTheme.bodyText2!.copyWith(
              fontSize: 12.0.sp,
              color: primaryTextColor,
            ),
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
              filled: true,
              fillColor: borderColor,
              hintText: 'Username',
              hintStyle: textTheme.bodyText2!.copyWith(fontSize: 12.0.sp),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 1.0.wp),
              enabled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF707070),
                ),
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade300),
              ),
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 1,
          child: SecondaryActionButton(
            label: 'Update',
            onClick: _onUpdateUsernameClicked,
          ),
        ),
      ],
    );
  }

  void _onUploadTokenClicked(BuildContext context) {
    final controller = Get.find<OnboardController>();

    controller.pickTextFileFromDevice().then((shallProceed) {
      if (shallProceed) {
        controller.controller.text = _homeController.usernameController.text;
        controller.storeTokenAndUsername();
      }
    });
  }

  void _onUpdateUsernameClicked() {
    final controller = Get.find<OnboardController>();
    final username = _homeController.usernameController.text;
    final token = _homeController.storedUser.value!.token;

    controller.updateTokenAndUsername(username: username, token: token);
  }
}
