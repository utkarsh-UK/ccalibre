import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/domain/entities/repository.dart';
import 'package:ccalibre/presentation/getx/home/controller.dart';
import 'package:ccalibre/presentation/getx/user/controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RepoTile extends StatelessWidget {
  final Repository repository;

  const RepoTile({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(
        repository.fullName,
        style: textTheme.headline6!.copyWith(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        repository.description == 'null'
            ? 'No description found'
            : repository.description,
        style: textTheme.subtitle2!.copyWith(
          fontSize: 10.0.sp,
          height: 1.2,
        ),
      ),
      trailing: InkWell(
        onTap: () => confirmRepositoryAddition(
            context, repository.fullName, repository.url),
        child: CircleAvatar(
          radius: 6.0.wp,
          backgroundColor: accentColor,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 5.0.wp,
            ),
          ),
        ),
      ),
    );
  }

  void confirmRepositoryAddition(
      BuildContext context, String repoName, String repoURL) {
    final userController = Get.find<UserController>();
    final homeController = Get.find<HomeController>();

    userController.showDialog(
      context: context,
      title: 'Add Application',
      message:
          'Are you sure you want to add $repoName to applications?\nClick Add to proceed.',
      onPrimaryBtnClick: () => homeController.creatApplication(repoURL),
      primaryBtnText: 'Add',
    );
  }
}
