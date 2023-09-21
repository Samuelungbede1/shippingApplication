import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../use_cases/home/controller/home_controller.dart';
import '../use_cases/nav_wrapper/controller/nav_wrapper_controller.dart';
import '../util/app_color_palette.dart';
import '../util/app_strings.dart';

class CustomAppBarContainer extends StatefulWidget {
  final double animatedHeight;
  CustomAppBarContainer({
    super.key,
    required this.animatedHeight,
  });

  @override
  State<CustomAppBarContainer> createState() => _CustomAppBarContainerState();
}

class _CustomAppBarContainerState extends State<CustomAppBarContainer>
    with TickerProviderStateMixin {
  final HomeController homeController = Get.put(HomeController());
  late AnimationController animatedAppBar;
  late AnimationController animatedSearch;
  final NavWrapperController navController = Get.put(NavWrapperController());
  late Animation<double> _arrowIconAnim;


  late Animation<double> appBarHeight;
  late Animation<double> searchPadding;
  late Animation<double> sizBoxHeight;

  @override
  void initState() {
    super.initState();
    animatedAppBar = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animatedSearch = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animatedSearch.forward();
    animatedAppBar.forward();

    animatedAppBar.addListener(() {
      print("_appBarHeight===${appBarHeight.value}");
    });
    appBarHeight = Tween<double>(
      begin: homeController.begin.value,
      end: homeController.end.value,
    ).animate(CurvedAnimation(
      parent: animatedAppBar,
      curve: Curves.easeIn,
    ));

    searchPadding = Tween<double>(
      begin: 10,
      end: 50,
    ).animate(CurvedAnimation(
      parent: animatedSearch,
      curve: Curves.easeIn,
    ));

    sizBoxHeight = Tween<double>(
      begin: 10,
      end: 0,
    ).animate(CurvedAnimation(
      parent: animatedSearch,
      curve: Curves.easeIn,
    ));

    _arrowIconAnim = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: animatedAppBar,
      curve: Curves.linearToEaseOut,
    ));


  }

  @override
  void dispose() {
    animatedAppBar.dispose();
    animatedSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
            animation: animatedAppBar,
            builder: (context, child) {
              return Obx(
                () => Container(
                  color: AppColorPalette.violet,
                  child: Column(
                    children: [
                      SizedBox(height: appBarHeight.value),
                      Container(
                        height: homeController.visible.isFalse
                            ? widget.animatedHeight
                            : 160,
                        color: AppColorPalette.violet,
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 10.0,
                          left: 10,
                          bottom: 5.0,
                        ),
                        child: Obx(
                          () => Column(
                            children: [
                              Row(
                                children: [

                                  AnimatedOpacity(
                                    opacity:
                                    homeController.visible.value ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.decelerate,
                                    child: Visibility(
                                      visible: homeController
                                          .visible.value,
                                      child: Row(children: [
                                        Image.asset(
                                          'assets/images/head_image.png',
                                          height: 70,
                                          width: 80,
                                        ),

                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/location.png',
                                                  height: 24,
                                                  width: 24,
                                                  scale: 1.9,
                                                ),
                                                const Text(
                                                  'Your Location',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Wertherimer, Illinois',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_down_sharp,
                                                  size: 60.w,
                                                  color: AppColorPalette.white,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 120.w,
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.notifications_none_outlined,
                                              size: 30,
                                            ),
                                            color: AppColorPalette.violet,
                                            onPressed: () {
                                            },
                                          ),
                                        ),
                                      ],),
                                    ),
                                  )


                                ],
                              ),

                        SizedBox(
                          height: 5.h,
                        ),
                              Row(
                                children: [
                                  Visibility(
                                    visible: !homeController
                                        .visible.value,
                                    maintainSize: false,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: AppColorPalette.violet,
                                      ),
                                      child: Transform.translate(
                                        offset: Offset(_arrowIconAnim.value, 0.0),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new,
                                            size: 25,
                                          ),
                                          color: AppColorPalette.white,
                                          onPressed: () {
                                            homeController.visible.value = true;
                                            homeController.searchFieldFocus.unfocus();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: AnimatedBuilder(
                                    animation: animatedSearch,
                                    builder: (child, context) {
                                      return Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(50.h),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 16.w),
                                        margin: EdgeInsets.only(
                                            right: 15.w,
                                            // left: homeController.visible.value ? 10 : searchPadding.value
                                        ), // animate the margin left from 10-50
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 20),
                                            const Icon(
                                              Icons.search,
                                              color: AppColorPalette.violet,
                                            ),
                                            SizedBox(width: 8.w),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  // Set focus when tapped
                                                },
                                                child: TextField(
                                                  focusNode: homeController
                                                      .searchFieldFocus,
                                                  style: const TextStyle(
                                                    color: AppColorPalette.violet,
                                                    fontSize: 18,
                                                  ),
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        AppColorPalette.white,
                                                    focusColor:
                                                        AppColorPalette.white,
                                                    enabledBorder: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    hintText: AppStrings.search,
                                                    hintStyle: TextStyle(
                                                      color: AppColorPalette.gray
                                                          .withOpacity(0.7),
                                                      fontSize: 18,
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
                                                icon: const Icon(
                                                  Icons
                                                      .indeterminate_check_box_outlined,
                                                  size: 30,
                                                ),
                                                color: AppColorPalette.white,
                                                onPressed: () {
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                ),
                                  ),
                                ]
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
