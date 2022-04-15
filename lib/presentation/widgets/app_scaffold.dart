import 'package:ccalibre/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final List<Widget> children;

  const AppScaffold({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: size.height - kToolbarHeight,
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0.wp,
                vertical: 4.0.wp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
