import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/app_color_palette.dart';
import '../../../util/base_styles.dart';

class DropDownComponent extends StatelessWidget {
  final IconData? rightIcon;

  DropDownComponent({
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.w, left: 30.w, right: 20.w, bottom: 15.w),
      padding: EdgeInsets.only(left: 30.w, right: 20.w),
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColorPalette.whiteGrey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/grey_box.png',
            height: 45,
            width: 40,
          ),
          const Text(
            "|",
            style: lightGreyText,
          ),
          SizedBox(width: 10.w),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Box',
                  style: textWithPryColor,
                ),
              ],
            ),
          ),
          Icon(
            rightIcon,
            size: 35,
            color: AppColorPalette.gray,
          ),
        ],
      ),
    );
  }
}
