import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../util/app_color_palette.dart';
import '../../../util/base_styles.dart';
import '../../home/controller/home_controller.dart';

class ShipmentCard extends StatefulWidget {
  final String textOne;
  final String textTwo;
  final String amountText;
  final String dateText;
  final String status;

  ShipmentCard({
    required this.textOne,
    required this.textTwo,
    required this.amountText,
    required this.dateText,
    required this.status,
  });

  @override
  State<ShipmentCard> createState() => _ShipmentCardState();
}

class _ShipmentCardState extends State<ShipmentCard>
    with TickerProviderStateMixin {
  late AnimationController animatedSizeBoxHeight;
  late Animation<double> _appBarHeight;
  late Animation<double> _trackingTextAnim;
  final HomeController homeController = Get.put(HomeController());

  Color getTextColorColor() {
    switch (widget.status) {
      case 'In Progress':
        return AppColorPalette.green;
      case 'Pending':
        return AppColorPalette.orange;
      case 'Loading':
        return AppColorPalette.blue;
      default:
        return AppColorPalette.black;
    }
  }

  IconData getIcon() {
    switch (widget.status) {
      case 'In Progress':
        return Icons.recycling;
      case 'Pending':
        return Icons.refresh;
      case 'Loading':
        return Icons.downloading;
      default:
        return Icons.refresh;
    }
  }


  @override
  void initState() {
    super.initState();

    animatedSizeBoxHeight = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    animatedSizeBoxHeight.forward();

    animatedSizeBoxHeight.addListener(() {
      print("_appBarHeight===${_appBarHeight.value}");
    });
    _appBarHeight = Tween<double>(
      begin: homeController
          .appBarHeightBegin.value,
      end: homeController
          .appBarHeightEnd.value,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.ease,
    ));

    _trackingTextAnim = Tween<double>(
      begin: 60.0,
      end: 8.0,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.linearToEaseOut,
    ));
  }

  @override
  void dispose() {
    animatedSizeBoxHeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animatedSizeBoxHeight,
        builder: (context, child) {
          final textStatusColor = getTextColorColor();
          final icon = getIcon();
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: _trackingTextAnim.value),
            child: Container(
              width: 150.0.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: AppColorPalette.white,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 40.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          width: 120.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: AppColorPalette.lightGrey,
                            borderRadius: BorderRadius.circular(
                                18.0),
                          ),
                          child:  Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        icon,
                                        size: 18,
                                        color: textStatusColor,
                                      ),
                                      SizedBox(
                                          width:
                                              8),
                                      Text(
                                        widget.status,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15, color:
                                        textStatusColor),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          widget.textOne,
                          style: headerText2,
                        ),
                        SizedBox(
                          width:
                              240,
                          child: Text(
                            widget.textTwo,
                            style: subtitleText,
                            maxLines: 2,
                            softWrap:
                                true,
                            overflow: TextOverflow
                                .visible,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.amountText,
                              style: amountTextStyle,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              widget.dateText,
                              style: bodyText2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/grey_box.png',
                    height: 70,
                    width: 80,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
