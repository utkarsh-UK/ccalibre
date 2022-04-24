import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/domain/entities/application.dart';
import 'package:ccalibre/presentation/getx/build/controller.dart';
import 'package:ccalibre/presentation/getx/user/controller.dart';
import 'package:ccalibre/presentation/widgets/dropdown_input.dart';
import 'package:ccalibre/presentation/widgets/primary_action_button.dart';
import 'package:ccalibre/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class StartBuildSheet extends StatelessWidget {
  final Application application;
  final bool shouldPresetWorkflow;
  final String? selectedWorkflow;

  StartBuildSheet({
    Key? key,
    required this.application,
    this.shouldPresetWorkflow = false,
    this.selectedWorkflow = 'Select Workflow',
  }) : super(key: key);

  final UserController _userController = Get.find<UserController>();
  final BuildController _buildController = Get.find<BuildController>();

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
          DropdownInput(
            values: shouldPresetWorkflow
                ? [selectedWorkflow!]
                : (application.workflows
                    .map<String>((work) => work.name)
                    .toList()
                  ..insert(0, 'Select Workflow')),
            onDropdownChanged:
                shouldPresetWorkflow ? null : _onWorkflowDropDownChanged,
          ),
          SizedBox(height: 4.0.wp),
          DropdownInput(
            values: ['Select Branch', ...application.branches],
            onDropdownChanged: _onBranchDropDownChanged,
          ),
          SizedBox(height: 4.0.wp),
          Text(
            'Add environment variables (Optional)',
            style: textTheme.bodyText2!.copyWith(fontSize: 14.0.sp),
          ),
          SizedBox(height: 3.0.wp),
          Obx(
            () => Column(
              children: _buildController.envVariables.keys
                  .map<Widget>((env) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                right: 3.0.wp,
                                bottom: 3.0.wp,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.0.wp,
                                vertical: 3.0.wp,
                              ),
                              color: borderColor,
                              child: Text(
                                env,
                                style: textTheme.headline6!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0.sp,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                right: 3.0.wp,
                                bottom: 3.0.wp,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.0.wp,
                                vertical: 3.0.wp,
                              ),
                              color: borderColor,
                              child: Text(
                                _buildController.envVariables[env]!,
                                style: textTheme.headline6!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextInputField(
                    controller: _buildController.variableKeyController,
                    ),
              ),
              SizedBox(width: 4.0.wp),
              Flexible(
                child: TextInputField(
                    controller: _buildController.variableValueController,
                    ),
              ),
              SizedBox(width: 4.0.wp),
              OutlinedButton(
                onPressed: _buildController.addEnvVariable,
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
              child: PrimaryActionButton(
                label: 'Start Build',
                iconData: FontAwesomeIcons.plus,
                onClick: _onStartBuild,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onWorkflowDropDownChanged(String? changedWork) {
    if (changedWork == null || changedWork == 'Select Workflow') return;

    final selectedWork = application.workflows
        .firstWhere((workflow) => workflow.name == changedWork);

    _userController.setSelectedWorkflowID(selectedWork.id);
  }

  void _onBranchDropDownChanged(String? changedBranch) {
    if (changedBranch == null || changedBranch == 'Select Branch') return;

    _userController.setSelectedBranch(changedBranch);
  }

  void _onStartBuild() {
    final selectedWorkID = _userController.selectedWorkflowID.value;
    final selectedBranch = _userController.selectedBranch.value;

    if (selectedWorkID.isEmpty || selectedBranch.isEmpty) return;

    _buildController
        .startBuild(application.id, selectedWorkID, selectedBranch)
        .then((_) => Get.back());
  }
}
