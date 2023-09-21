import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../util/app_color_palette.dart';
import '../../calculate/view/calculate_screen.dart';
import '../../extimated_amount/view/extimated_amount_screen.dart';
import '../../home/controller/home_controller.dart';
import '../../home/views/home_screen.dart';
import '../../shipment_history/view/shipment_history_screen.dart';
import '../controller/nav_wrapper_controller.dart';

class NavWrapper extends StatefulWidget {
  const NavWrapper({Key? key}) : super(key: key);

  @override
  State<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  final NavWrapperController navController = Get.put(NavWrapperController());
  final HomeController homeController = Get.put(HomeController());

  double indicatorLeft = 0.0;

  @override
  void initState() {
    super.initState();
    navController.pageIndex.listen((index) {
      setState(() {
        indicatorLeft = index * (MediaQuery.of(context).size.width / 4);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPalette.violet,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        reverse: false,
        onPageChanged: navController.onPageChanged,
        controller: navController.pageController,
        children: [
          HomeScreen(),
          const CalculateScreen(),
          const ShipmentHistoryScreen(),
          // const EstimatedAmountScreen(),
        ],
      ),
      bottomNavigationBar: Obx(() => Visibility(
        visible: homeController.visible.value,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: homeController.visible.value && navController.pageIndex.value != 1,
              child: SizedBox(
                height: 90,
                child: BottomNavigationBar(
                  selectedItemColor: AppColorPalette.violet,
                  currentIndex: navController.pageIndex.value,
                  onTap: (index) {
                    if(index==3){
                    } else{
                    navController.goToPage(index);
                    }
                  },
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calculate),
                      label: 'Calculate',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.history),
                      label: 'Shipments',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: indicatorLeft,
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 4,
                color: AppColorPalette.violet,
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class NavItem {
  final String title;
  final String iconPath;

  NavItem({
    required this.title,
    required this.iconPath,
  });
}

