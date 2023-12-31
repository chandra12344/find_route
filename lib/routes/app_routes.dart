import 'package:chandraprakash_s_application1/presentation/captcha_screen/captcha_screen.dart';
import 'package:chandraprakash_s_application1/presentation/captcha_screen/binding/captcha_binding.dart';
import 'package:chandraprakash_s_application1/presentation/map_screen/map_screen.dart';
import 'package:chandraprakash_s_application1/presentation/chatbot_screen/binding/chatbot_binding.dart';
import 'package:chandraprakash_s_application1/presentation/store_locator_screen/route_locator_screen.dart';
import 'package:chandraprakash_s_application1/presentation/store_locator_screen/binding/store_locator_binding.dart';
import 'package:get/get.dart';
import '../google_map.dart';
import '../presentation/dashboard_screen.dart';
import '../presentation/map_screen/binding/map_binding.dart';

class AppRoutes {
  static const String captchaScreen = '/captcha_screen';
  static const String mapScreen = '/map_screen';
  static const String routeLocatorScreen = '/route_locator_screen';
  static const String chatbotScreen = '/chatbot_screen';
  static const String googlemap = '/googlemap_screen';
  static const String dashboard = '/dashboard_screen';
  static List<GetPage> pages = [
    GetPage(
      name: captchaScreen,
      page: () => CaptchaScreen(),
      bindings: [
        CaptchaBinding(),
      ],
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: googlemap,
      page: () => MapSample(),
    ),
    GetPage(
      name: mapScreen,
      page: () => MainMapScreen(),
      bindings: [
        MapBinding(),
      ],
    ),
    GetPage(
      name: routeLocatorScreen,
      page: () => RouteLocatorScreen(),
      bindings: [
        RouteLocatorBinding(),
      ],
    ),
  ];
}
