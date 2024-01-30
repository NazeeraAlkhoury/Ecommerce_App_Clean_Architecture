import 'package:ecommerce_app/features/home/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/category_detials_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/favorite_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/products_details_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/profile_screen.dart';
import 'package:ecommerce_app/features/onboarding/on_boarding_screen.dart';
import 'package:ecommerce_app/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:ecommerce_app/features/authentication/presentation/screens/register/register_screen.dart';
import 'package:ecommerce_app/features/app/presentation/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';

import '../../../features/splashScreen/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';

  // authentication
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  //layout
  static const String layoutRoute = '/layout';
  static const String homeRoute = '/home';
  static const String favoriteRoute = '/favorite';

  static const String cartRoute = '/cart';
  static const String profileRoute = '/profile';

  static const String categoryDetialsRoute = '/categoryDetials';
  static const String categories = '/categories';

  static const String productDetailsRoute = '/productDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );

      case Routes.layoutRoute:
        return MaterialPageRoute(
          builder: (context) => const LayoutScreen(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case Routes.favoriteRoute:
        return MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
        );

      case Routes.cartRoute:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );

      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      case Routes.categories:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );

      case Routes.categoryDetialsRoute:
        // final id = routeSettings.arguments as int;
        final arguments = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => CategorieDetials(
            arguments: arguments,

            // id: arguments['id'],
            // name: arguments['name'],
          ),
        );

      case Routes.productDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailsScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppString.notFoundRout),
        ),
        body: const Text(AppString.notFoundRout),
      ),
    );
  }
}
