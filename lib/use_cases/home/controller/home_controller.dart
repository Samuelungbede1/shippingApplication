
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {

  final FocusNode searchFieldFocus = FocusNode();
  RxBool visible = true.obs;
  late AnimationController animatedSizeBoxHeight;
  RxDouble begin = 5.0.obs;
  RxDouble end = 55.0.obs;
  RxDouble appBarHeightBegin = 180.0.obs;
  RxDouble appBarHeightEnd = 100.0.obs;


  @override
  onReady() async {
    searchFieldFocusFocusNodeListener();
    super.onReady();
  }

void searchFieldFocusFocusNodeListener() {
  searchFieldFocus.addListener(() {
    if (!searchFieldFocus.hasFocus ) {
      begin.value = 4.0;
      end.value = 25.0;
      appBarHeightBegin.value = 40.0;
      appBarHeightEnd.value = 180.0;
      visible.value = true;
    } else if (searchFieldFocus.hasFocus) {
      begin.value =  100.0;
      end.value = 30.0;
      appBarHeightBegin.value = 180.0;
      appBarHeightEnd.value = 40.0;
      visible.value = false;

    }
  });
}

}