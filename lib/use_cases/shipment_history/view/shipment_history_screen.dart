import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monie_point/use_cases/nav_wrapper/view/nav_wrapper.dart';

import '../../../res/base_styles.dart';
import '../../../util/app_color_palette.dart';
import '../../../util/app_strings.dart';
import '../../../util/base_styles.dart';
import '../../../util/navigation_functions.dart';
import '../../home/controller/home_controller.dart';
import '../../home/views/home_screen.dart';
import '../../nav_wrapper/controller/nav_wrapper_controller.dart';
import '../widgets/all_shipment_tab.dart';
import '../widgets/custom_tab.dart';
import '../widgets/shipment_inprogress_tab.dart';

class ShipmentHistoryScreen extends StatefulWidget {
  const ShipmentHistoryScreen({super.key});

  @override
  State<ShipmentHistoryScreen> createState() => _ShipmentHistoryScreenState();
}

class _ShipmentHistoryScreenState extends State<ShipmentHistoryScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;
  final NavWrapperController navController = Get.put(NavWrapperController());

  late AnimationController animatedSizeBoxHeight;
  late Animation<double> _appBarHeight;
  late Animation<double> _trackingTextAnim;
  late Animation<double> _arrowIconAnim;


  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
        print(selectedIndex);
      });
    });
    animatedSizeBoxHeight = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    animatedSizeBoxHeight.forward();

    animatedSizeBoxHeight.addListener(() {
      print("_appBarHeight===${_appBarHeight.value}");
    });
    _appBarHeight = Tween<double>(
      begin: 100,
      end: 35,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.ease,
    ));

    _trackingTextAnim = Tween<double>(
      begin: 60.0,
      end: 30.0,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.linearToEaseOut,
    ));

    _arrowIconAnim = Tween<double>(
      begin: -30.0,
      end: 10.0,
    ).animate(CurvedAnimation(
      parent: animatedSizeBoxHeight,
      curve: Curves.linearToEaseOut,
    ));
  }

  @override
  void dispose() {
    animatedSizeBoxHeight.dispose();
    tabController
        .dispose();

    super.dispose();
  }


  final List<String> tabs = [
    'All',
    'Completed',
    'In progress',
    'Pending Order',
    'Cancelled',
  ];


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animatedSizeBoxHeight,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            backgroundColor: AppColorPalette.bgColor,
            appBar: AppBar(
              backgroundColor: AppColorPalette.violet,
              toolbarHeight: _appBarHeight.value,
              automaticallyImplyLeading: false,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  navController.goToPage(0);
                },
                child: Transform.translate(
                  offset: Offset(_arrowIconAnim.value, 0.0), // Move horizontally
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                    color: AppColorPalette.white,
                  ),
                ),
              ),
              centerTitle: true,
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.shipmentHistory, style: plainWhiteText),
                ],
              ),
              bottom: TabBar(
                labelStyle: title,
                isScrollable: true,
                indicatorColor: AppColorPalette.orange,
                indicatorWeight: 4,
                labelColor: AppColorPalette.white,
                controller: tabController,
                labelPadding:  EdgeInsets.only(left: _trackingTextAnim.value, right: 5),
                indicatorPadding: const EdgeInsets.only(
                  left: 20,
                ),
                tabs: tabs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final label = entry.value;

                  return CustomTab(
                    label: label,
                    isSelected: tabController.index == selectedIndex,
                    selectedColor: index == selectedIndex
                        ? AppColorPalette.orange
                        : AppColorPalette.lightViolet,
                  );
                }).toList(),
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: const [
                AllShipmentTab(),
                AllShipmentTab(),
                ShipmentInProgressTab(),
                AllShipmentTab(),
                AllShipmentTab(),
              ],
            ),
          );
        });
  }
}
