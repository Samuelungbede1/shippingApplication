
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monie_point/use_cases/nav_wrapper/controller/nav_wrapper_controller.dart';

import 'app.dart';


final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    App(),
  );
}



