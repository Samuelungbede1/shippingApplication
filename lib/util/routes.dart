import 'package:flutter/widgets.dart';
import 'package:monie_point/use_cases/calculate/view/calculate_screen.dart';
import '../use_cases/home/views/error.dart';
import '../use_cases/home/views/home_screen.dart';
import '../use_cases/nav_wrapper/view/nav_wrapper.dart';
import '../use_cases/shipment_history/view/shipment_history_screen.dart';
import 'navigation_builder.dart';

class AppRoutes {
  AppRoutes();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return NavigationBuilder( const NavWrapper(), settings: settings);
      case shipmentHistoryScreen:
        return NavigationBuilder(const ShipmentHistoryScreen(), settings: settings);
        case calculatorScreen:
        return NavigationBuilder(const CalculateScreen(), settings: settings);
      default:
        return NavigationBuilder(const ErrorPage(), settings: settings);
    }
  }

  static const String homeScreen = '/homeScreen';
  static const String shipmentHistoryScreen = '/shipmentHistoryScreen';
  static const String calculatorScreen = '/calculatorScreen';
  static const String errorPage = '/ErrorPage';
}
