import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_color_palette.dart';


class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColorPalette.CUSTOM_BACKGROUND,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: Platform.isIOS
                  ? const Icon(Icons.arrow_back_ios)
                  : const Icon(Icons.arrow_back),
              onPressed: () => Get.back()),
        ),
        body: const Center(
          child:Text('Page not found'),
        ));
  }
}
