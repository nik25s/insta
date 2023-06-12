import 'package:flutter/material.dart';
import 'package:insta/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {required this.webScreenLayout, required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // web screen
        return webScreenLayout;
      }
      // mobile screen
      return mobileScreenLayout;
    });
  }
}
