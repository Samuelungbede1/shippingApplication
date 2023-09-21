import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point/util/base_styles.dart';

import '../../../util/app_color_palette.dart';

class CustomTextInputField extends StatelessWidget {
  final double maxHeight;
  final Icon? leadingIcon;
  final String hintText; // Add a parameter for hintText

  CustomTextInputField({
    this.maxHeight = kToolbarHeight,
    this.leadingIcon,
    required this.hintText, // Require hintText as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight,
      decoration: BoxDecoration(
        color: AppColorPalette.lightGrey,
        borderRadius: BorderRadius.circular(18.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          if (leadingIcon != null) leadingIcon!,
          SizedBox(width: 3),
          const Text(
            "|",
            style: lightGreyText,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              style: const TextStyle(
                color: AppColorPalette.primaryColor,
                fontSize: 23,
              ),
              decoration: InputDecoration(
                fillColor: AppColorPalette.white,
                focusColor: AppColorPalette.white,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText, // Use the provided hintText
                hintStyle: textWithPryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
