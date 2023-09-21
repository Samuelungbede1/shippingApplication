import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_point/util/app_color_palette.dart';

class AddComponent extends StatelessWidget {
  const AddComponent({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 0),
      child: Column(
        children: [
          SizedBox(
            height: 28.h,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50.0.w),
                  top: Radius.zero,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColorPalette.gray.withOpacity(0.1),
                    spreadRadius: 2.0,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: content,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
