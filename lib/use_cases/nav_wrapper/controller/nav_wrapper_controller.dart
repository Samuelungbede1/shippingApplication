import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class NavWrapperController extends GetxController {
  RxInt pageIndex = 0.obs;
  PageController pageController = PageController();


  @override
  void onInit() {
    super.onInit();
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  void goToPage(int index) {
    pageController.jumpToPage(index);
    print(index);
    pageIndex.value = index;
  }
}
