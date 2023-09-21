import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const mockupHeight = 812;
const mockupWidth = 375;

sHeight(BuildContext context) {
  return (dynamic height) {
    // double screenHeight = MediaQuery.of(context).size.height *
    //     MediaQuery.of(context).devicePixelRatio;
    double screenHeight = MediaQuery.of(context).size.height;
    double result = screenHeight * (height / mockupHeight);
    return result.sp;
  };
}

sWidth(BuildContext context) {
  return (dynamic width) {
    double screenWidth = MediaQuery.of(context).size.width;
    double result = screenWidth * (width / mockupWidth);
    return result.sp;
  };
}

Size displaySize(BuildContext context) {
  debugPrint('Size = ${MediaQuery.of(context).size}');
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ${displaySize(context).height}');
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ${displaySize(context).width}');
  return displaySize(context).width;
}

class Screen {
  final Size screenSize;

  Screen(this.screenSize);

  double wp(percentage) {
    double result = percentage / 100 * screenSize.width;
    return result.sp;
  }

  double hp(percentage) {
    double result = percentage / 100 * screenSize.height;
    return result.sp;
  }
}
