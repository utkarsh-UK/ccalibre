import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/screens/home/widgets/empty_apps.dart';
import 'package:ccalibre/presentation/widgets/app_scaffold.dart';
import 'package:ccalibre/presentation/widgets/custom_top_bar.dart';
import 'package:ccalibre/presentation/widgets/secondary_action_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      children: [
        const CustomTopBar(),
        SizedBox(height: 8.0.wp),
        const EmptyApps(),
        const Spacer(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0.wp),
          child: const SecondaryActionButton(label: 'View Repositories'),
        ),
      ],
    );
  }
}
