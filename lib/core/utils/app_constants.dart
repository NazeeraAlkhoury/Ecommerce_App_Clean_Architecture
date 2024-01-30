// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/utils/app_preferences.dart';

class AppConstants {
  static void printFullText(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) {
      print(match.group(0));
    });
  }

  static String? token = sl<AppPreferences>().getToken();
}
