import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/app_color_palette.dart';
import '../../../util/app_strings.dart';

class CustomSearchBar extends StatelessWidget {
  final double maxHeight;
  final VoidCallback? onTap;

  CustomSearchBar({super.key,
    this.maxHeight = kToolbarHeight,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(95.h),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.only(right: 15.w, left: 10.w),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: AbsorbPointer(
                absorbing: true,
                child: TextField(
                  // readOnly: false,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    fillColor: AppColorPalette.white,
                    focusColor: AppColorPalette.white,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: AppStrings.search,
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColorPalette.orange,
            ),
            child: IconButton(
              icon: Icon(
                Icons.indeterminate_check_box_outlined,
                size: 90.w,
              ),
              color: AppColorPalette.white,
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }
}
