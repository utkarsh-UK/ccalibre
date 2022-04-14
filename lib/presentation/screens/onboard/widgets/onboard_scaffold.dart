import 'package:ccalibre/core/theme/colors.dart';
import 'package:flutter/material.dart';

class OnboardScaffold extends StatelessWidget {
  final List<Widget> children;

  const OnboardScaffold({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: borderColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
