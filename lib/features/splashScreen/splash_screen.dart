// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/utils/app_constants.dart';
import 'package:ecommerce_app/core/utils/app_preferences.dart';
import 'package:ecommerce_app/features/app/presentation/screens/layout_screen.dart';

import 'package:ecommerce_app/features/onboarding/on_boarding_screen.dart';
import 'package:ecommerce_app/features/authentication/presentation/screens/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool? isOnBoardingViewScreen = _appPreferences.isOnBoardingScreen();
    String? token = _appPreferences.getToken();
    print(AppConstants.token);

    Widget getWidget() {
      if (isOnBoardingViewScreen != null) {
        if (token != null) {
          return const LayoutScreen();
        } else {
          return const LoginScreen();
        }
      } else {
        return const OnBoardingScreen();
      }
    }

    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/lotties/splash.json',
          height: 100, width: 100, fit: BoxFit.cover),
      nextScreen: getWidget(),
      //  isOnBoardingViewScreen == null
      //     ? const OnBoardingScreen()
      //     : const LoginScreen(),
      backgroundColor: AppColorsLight.primaryColor,
    );
  }
}
