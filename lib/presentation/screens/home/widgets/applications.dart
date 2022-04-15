import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/screens/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Applications extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  final bool isHeadingShown;

  Applications({Key? key, this.isHeadingShown = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Column(
        children: [
          if (isHeadingShown)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Applications (${_homeController.applications.length})',
                  style: textTheme.headline5,
                ),
                Text(
                  'view all',
                  style: textTheme.subtitle2!.copyWith(
                    color: bodyTextColor,
                  ),
                ),
              ],
            ),
          SizedBox(height: 6.0.wp),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (_, __) =>
                const Divider(color: Color(0xFF16182C), thickness: 1.2),
            itemBuilder: (_, index) => ListTile(
              title: Text(
                'Persuit-Mobile',
                style: textTheme.headline6!.copyWith(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '2 workflows',
                style: textTheme.subtitle2!.copyWith(
                  fontSize: 12.0.sp,
                  height: 2.0,
                ),
              ),
              trailing: CircleAvatar(
                radius: 6.0.wp,
                backgroundColor: accentColor,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: 5.0.wp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
