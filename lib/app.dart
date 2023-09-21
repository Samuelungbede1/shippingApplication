import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/material.dart';
import 'package:monie_point/res/app_theme.dart';
import 'package:monie_point/use_cases/home/views/home_screen.dart';
import 'package:monie_point/use_cases/nav_wrapper/controller/nav_wrapper_controller.dart';
import 'package:monie_point/use_cases/nav_wrapper/view/nav_wrapper.dart';
import 'package:monie_point/util/routes.dart';


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize:  Size(896, 414),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (TapDownDetails e) {
          print("Tapped Down");
          // controller.startTimer();
        },
        child: GetMaterialApp(
          // initialRoute: "/",
          title: 'MONEY POINT',
          // getPages:  [
          //   GetPage(name: "/homeScreen", page: () =>  HomeScreen()), // here!
          // ],
          theme: getAppThemeData(),
          initialRoute: AppRoutes.homeScreen,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          defaultTransition: Transition.fadeIn,
          opaqueRoute: Get.isOpaqueRouteDefault,
          popGesture: Get.isPopGestureEnable,
          smartManagement: SmartManagement.full,
          // home:  HomeScreen(),
        ),
      );},
    );
  }
}
