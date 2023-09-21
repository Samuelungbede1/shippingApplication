import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point/util/app_color_palette.dart';
import 'package:monie_point/util/base_styles.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final String text;
  final int selectedIndex;
  final Color selectedColor;
  final Function(int) onTap;

  const CategoryItem(
      {Key? key,
        required this.index,
        required this.text,
      required this.selectedIndex,
      required this.selectedColor,
      required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
        print("TAPPED ${index}");
        print("INDEX ${index}");
        print("SELECTED INDEX ${selectedIndex}");
        // Handle item tap
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:[ Container(
          width: 185.w,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: AppColorPalette.gray, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
            color: selectedIndex== index ? AppColorPalette.deepBlue : AppColorPalette.white,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (selectedIndex == index)
                  const Icon(
                    Icons.check,
                    color: AppColorPalette.white,
                    size: 15,
                  ),
                Text(
                  '$text',
                  style: selectedIndex== index ? selectedTextStyle: textWithPryColor ,
                ),
              ],
            ),
          ),
        ),]
      ),
    );
  }
}