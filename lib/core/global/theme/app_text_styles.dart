import 'package:ecommerce_app/core/global/theme/app_fonts.dart';
import 'package:flutter/material.dart';

TextStyle getTextStyle(double fontsize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: AppFontFamily.fontFamily,
    fontSize: fontsize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getExtraLightStyle({double fontsize = 12, required Color color}) {
  return getTextStyle(fontsize, AppFontWeight.extraLight, color);
}

TextStyle getLightStyle({double fontsize = 12, required Color color}) {
  return getTextStyle(fontsize, AppFontWeight.light, color);
}

TextStyle getRegularStyle({double fontsize = 12, required Color color}) {
  return getTextStyle(fontsize, AppFontWeight.regular, color);
}

TextStyle getMediumStyle({double fontsize = 12, required Color color}) {
  return getTextStyle(fontsize, AppFontWeight.medium, color);
}

TextStyle getSemiBoldStyle({double fontsize = 12, required Color color}) {
  return getTextStyle(fontsize, AppFontWeight.semiBold, color);
}

TextStyle getBoldStyle({double fontsize = 12, required Color color}) {
  return getTextStyle(fontsize, AppFontWeight.bold, color);
}

TextStyle getBlackStyle({double fontsize = 12, required Color color}) {
  return getTextStyle(fontsize, AppFontWeight.bold, color);
}
