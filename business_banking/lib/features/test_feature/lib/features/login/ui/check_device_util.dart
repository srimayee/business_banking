import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CheckDeviceConstraintsUtil {
  factory CheckDeviceConstraintsUtil() {
    return _singleton;
  }
  CheckDeviceConstraintsUtil._internal();
  static final CheckDeviceConstraintsUtil _singleton =
      CheckDeviceConstraintsUtil._internal();

  double getDeviceWidth(BuildContext context) {
    return ResponsiveWrapper.of(context).screenWidth;
  }

  double getDeviceHeight(BuildContext context) {
    return ResponsiveWrapper.of(context).screenHeight;
  }

  bool isLandScapeOrientation(BuildContext context) {
    return ResponsiveWrapper.of(context).orientation == Orientation.landscape;
  }

  bool isMobileDevice(BuildContext context) {
    return ResponsiveWrapper.of(context).isMobile;
  }

  bool isIphone5s(BuildContext context) {
    return ResponsiveWrapper.of(context).screenWidth <= 320;
  }
}
