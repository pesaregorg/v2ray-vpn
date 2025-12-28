import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  static const double mobileBreakpoint = 850;
  static const double tabletBreakpoint = 1100;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static DeviceType deviceType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= tabletBreakpoint) return DeviceType.desktop;
    if (width >= mobileBreakpoint) return DeviceType.tablet;
    return DeviceType.mobile;
  }


  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tabletBreakpoint &&
          MediaQuery.sizeOf(context).width >= mobileBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletBreakpoint;


  static double setSize(BuildContext context, {double mobile = 1, double tablet = 1, double desktop = 1}) {
    switch (deviceType(context)) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.desktop:
        return desktop;
    }
  }

  static Color setColor(BuildContext context, {Color mobile = Colors.transparent, Color tablet = Colors.transparent, Color desktop = Colors.transparent}) {
    switch (deviceType(context)) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.desktop:
        return desktop;
    }
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        Widget child;

        if (width >= tabletBreakpoint) {
          child = desktop;
        } else if (width >= mobileBreakpoint && tablet != null) {
          child = tablet!;
        } else {
          child = mobile;
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: child,
        );
      },
    );
  }
}
