import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData getAppThemeData() {
  return ThemeData(
      fontFamily: "OpenSans",
      primaryColor: primaryColor,
      scaffoldBackgroundColor: white,
      appBarTheme: AppBarTheme(color: white),
      textTheme: const TextTheme(
        headline1: TextStyle(color: white, fontWeight: FontWeight.w600),
        headline2: TextStyle(fontWeight: FontWeight.w600, color: black3),
        headline3: TextStyle(fontWeight: FontWeight.w600, color: primaryColor),
        headline4: TextStyle(fontWeight: FontWeight.w600, color: gray17),
        headline5: TextStyle(fontWeight: FontWeight.w600, color: black6),
        bodyText1: TextStyle(fontWeight: FontWeight.w600, color: gray16),
        subtitle1: TextStyle(fontWeight: FontWeight.w600, color: yellow),
        subtitle2: TextStyle(fontWeight: FontWeight.w400, color: goodGreen),
        bodyText2: TextStyle(fontWeight: FontWeight.w400, color: red),
        caption: TextStyle(fontWeight: FontWeight.w400, color: gray13),
        overline: TextStyle(
            fontWeight: FontWeight.w600, color: black, letterSpacing: 0.0),
        button: TextStyle(fontWeight: FontWeight.w600, color: gray13),
      ),
      buttonTheme:
          const ButtonThemeData(buttonColor: primaryColor, disabledColor: gray6));
}
