import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monie_point/use_cases/home/widgets/add_component.dart';
import 'package:monie_point/util/app_color_palette.dart';

import '../../../common_widgets/custom_app_bar.dart';
import '../../../util/app_strings.dart';
import '../../../util/base_styles.dart';
import '../../search/widgets/search_card.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/list_view_card.dart';
import '../widgets/shipment_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animatedSizeBoxHeight;
  late Animation<double> _appBarHeight;
  late Animation<double> _trackingTextAnim;
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    animatedSizeBoxHeight = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
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
      begin: 100.0,
      end: 200.0,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    animatedSizeBoxHeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    print("_appBarHeight===${_appBarHeight.value}");
    return Scaffold(
      backgroundColor: AppColorPalette.bgColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _appBarHeight,
              builder: (context, child) {
                return CustomAppBarContainer(
                  animatedHeight: _appBarHeight.value,
                );
              },
            ),
            Obx(
              () => Visibility(
                visible: homeController.visible.value,
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: _trackingTextAnim,
                      builder: (context, child) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 30.0.w,
                              right: 30.w,
                              top: 15,
                              // top: _trackingTextAnim.value,
                              bottom: 10),
                          child: const Row(
                            children: [
                              Text(
                                AppStrings.tracking,
                                style: headerText2,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    ShipmentCardComponent(
                      content: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0.w, vertical: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Shipment Number',
                                            style: subtitleText,
                                          ),
                                          Text(
                                            'BH0N8844HHD',
                                            style: headerText2,
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/cart.png',
                                        height: 80,
                                        width: 100,
                                      ),

                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/orange_box.png',
                                        height: 65,
                                        width: 65,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Sender',
                                              style: subtitleText),
                                          SizedBox(
                                            height: 10.w,
                                          ),
                                          const Text(
                                            'Atlanta 3535',
                                            style: title,
                                          ),
                                        ],
                                      ),
                                       SizedBox(
                                        width: 90.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Time',
                                              style: subtitleText),
                                          SizedBox(
                                            height: 10.w,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    9.0,
                                                height:
                                                    9.0,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors
                                                      .green,
                                                ),
                                              ),
                                              SizedBox(width: 5.w,),
                                              Text(
                                                '2 Days -3 Days',
                                                style: title,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/green_box.png',
                                        height: 65,
                                        width: 65,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Reciever', style: subtitleText),
                                          SizedBox(
                                            height: 10.w,
                                          ),
                                          Text(
                                            'Chicago, 4667',
                                            style: title,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Status', style: subtitleText),
                                          SizedBox(
                                            height: 10.w,
                                          ),
                                          Text(
                                            'Waiting to collect',
                                            style: title,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),

                    AddComponent(
                      content: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0.w, vertical: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 25.h,
                                        color: AppColorPalette.orange,
                                      ),
                                      const Text(
                                        'Add Stop',
                                        style: subtitleTextWithOrange,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _trackingTextAnim,
                      builder: (child, context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 45.w,
                              top: 8.h,
                              // top: _trackingTextAnim.value,
                              bottom: 5.h),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.availableVehicles,
                                style: headerText2,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: SizedBox(
                        height: 90.0.h,
                        width: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5, //
                          itemBuilder: (BuildContext context, int index) {
                            return const ListViewCard(
                              title: 'Cargo Freight',
                              subtitle: 'International',
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Obx(
              () => Visibility(
                visible: !homeController.visible.value,
                child: Column(
                  children: [
                    SearchCard(
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
