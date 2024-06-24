import 'package:get/get.dart';

import 'package:learn_getx/res/routes/routes_name.dart';
import 'package:learn_getx/view/splash_screen.dart';
import 'package:learn_getx/view/login/login_view.dart';
import 'package:learn_getx/view/home/home_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RoutesName.loginView,
            page: () => const LoginView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RoutesName.homeView,
            page: () => const HomeView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250))
      ];
}
