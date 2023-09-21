import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShipmentCardComponent extends StatelessWidget {
  const ShipmentCardComponent({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w,),
      child: Column(
        children: [
          SizedBox(
            height: 120.h,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50.0.w),
                  bottom: Radius.zero,
                ),
              ),
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}
