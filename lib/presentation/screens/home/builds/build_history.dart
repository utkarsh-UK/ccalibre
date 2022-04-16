import 'package:ccalibre/core/theme/colors.dart';
import 'package:ccalibre/core/utils/extensions.dart';
import 'package:ccalibre/presentation/screens/home/widgets/build_item.dart';
import 'package:ccalibre/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';

class BuildHistory extends StatelessWidget {
  const BuildHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SectionHeading(
          heading: 'Build History',
          actionText: 'view all',
        ),
        SizedBox(height: 6.0.wp),
        SizedBox(
          height: size.height * 0.25,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (_, __) => SizedBox(width: 5.0.wp),
            itemBuilder: (_, index) => RoundedCard(
              cardTitle: 'develop',
              footerText: 'Started 5m 48s ago',
              centerChild: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'FAILED\n'.toUpperCase(),
                        style: textTheme.headline5!.copyWith(
                          color: logoRedColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'with 2 artefacts',
                        style: textTheme.button!.copyWith(
                          color: logoRedColor,
                          fontSize: 10.0.sp,
                          height: 1.2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
