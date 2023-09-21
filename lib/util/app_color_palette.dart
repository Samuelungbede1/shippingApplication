// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class AppColorPalette {
  static const MaterialColor CUSTOM_YELLOW_BORDER = MaterialColor(
    0xFFF9CA78, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      // 50: Color(0xff4A9BDD), //10%
      // 100: Color(0xffb74c3a), //20%
      // 200: Color(0xffa04332), //30%
      // 300: Color(0xff89392b), //40%
      // 400: Color(0xff733024), //50%
      // 500: Color(0xff5c261d), //60%
      // 600: Color(0xff451c16), //70%
      // 700: Color(0xff2e130e), //80%
      // 800: Color(0xff170907), //90%
      // 900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor BLUE = MaterialColor(
    0xFF4A9BDD, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFE9F3FB),
      100: Color(0xFFC9E1F5),
      200: Color(0xFFA5CDEE),
      300: Color(0xFF80B9E7),
      400: Color(0xFF65AAE2),
      500: Color(0xFF4A9BDD),
      600: Color(0xFF4393D9),
      700: Color(0xFF3A89D4),
      800: Color(0xFF327FCF),
      900: Color(0xFF226DC7),
    },
  );

  static const MaterialColor TEXT_COLOR = MaterialColor(
    0xFF7B7777, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff333333), //10%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor CUSTOM_WHITE = MaterialColor(
    0xFFFFFFFF, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffffff), //10%
      100: Color(0xffffffff), //20%
      200: Color(0xffffffff), //30%
      300: Color(0xffffffff), //40%
      400: Color(0xffffffff), //50%
      500: Color(0xffffffff), //60%
      600: Color(0xffffffff), //70%
      700: Color(0xffffffff), //80%
      800: Color(0xffffffff), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static MaterialColor CUSTOM_BACKGROUND = const MaterialColor(
    0xFFF0F4FA, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffffff), //10%
      100: Color(0xffffffff), //20%
      200: Color(0xffffffff), //30%
      300: Color(0xffffffff), //40%
      400: Color(0xffffffff), //50%
      500: Color(0xffffffff), //60%
      600: Color(0xffffffff), //70%
      700: Color(0xffffffff), //80%
      800: Color(0xffffffff), //90%
      900: Color(0xff000000), //100%
    },
  );
  static MaterialColor CUSTOM_YELLOW = const MaterialColor(
    0xFFF9CA78, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFF1E0),
      200: Color(0xFFFEFCF6),
      300: Color(0xFFFAE1B3),
      400: Color(0xFFF9D696),
      500: Color(0xFFF7CB79),
      600: Color(0xFFF5C05C),
      700: Color(0xFFF4B53F),
      800: Color(0xFFF2A922),
      900: Color(0xFFE89C0E),
    },
  );

  static const MaterialColor LAVENDAR_GREY = MaterialColor(
    0xffE2E4E8, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffffff), //10%
      100: Color(0xffffffff), //20%
      200: Color(0xffffffff), //30%
      300: Color(0xffffffff), //40%
      400: Color(0xffffffff), //50%
      500: Color(0xffffffff), //60%
      600: Color(0xffffffff), //70%
      700: Color(0xffffffff), //80%
      800: Color(0xffffffff), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static const MaterialColor TEXT_GREY = MaterialColor(
    0xffB8B3B4, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffffff), //10%
      100: Color(0xffffffff), //20%
      200: Color(0xffffffff), //30%
      300: Color(0xffffffff), //40%
      400: Color(0xffffffff), //50%
      500: Color(0xffffffff), //60%
      600: Color(0xffffffff), //70%
      700: Color(0xffffffff), //80%
      800: Color(0xffffffff), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static const MaterialColor GREEN = MaterialColor(
    0xff67C7C0, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF67C7C0), //10%
      100: Color(0xffffffff), //20%
      200: Color(0xffffffff), //30%
      300: Color(0xffffffff), //40%
      400: Color(0xffffffff), //50%
      500: Color(0xffffffff), //60%
      600: Color(0xffffffff), //70%
      700: Color(0xffffffff), //80%
      800: Color(0xffffffff), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static const Color bgColor = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color black5 = Color(0xff454545);
  static const Color black2 = Color(0xff525252);
  static const Color black3 = Color(0xff1d3262);
  static const Color black4 = Color(0xff282828);
  static const Color black6 = Color(0xff181818);
  static const Color gray = Color(0xffadadad);
  static const Color gray2 = Color(0xffB8B8B8);
  static const Color gray3 = Color(0xff8d8d8d);
  static const Color gray5 = Color(0xffbcbcbbc);
  static const Color gray4 = Color(0xfff1f1f1);
  static const Color gray6 = Color(0xffc4c4c4);
  static const Color plainBlue = Color(0xff162e4d);
  static const Color gray8 = Color(0xfff2f2f2);
  static const Color gray9 = Color(0xffd9d9d9);
  static const Color gray10 = Color(0xfff6f6f6);
  static const Color gray14 = Color(0xff898989);
  static const Color gray13 = Color(0xff505050);
  static const Color gray17 = Color(0xff929292);
  static const Color gray11 = Color(0xffdfdfdf);
  static const Color gray18 = Color(0xffefefef);
  static const Color gray19 = Color(0xffeaeaea);
  static const Color gray20 = Color(0xfff8f8f8);
  static const Color gray21 = Color(0xff6d6d6d);
  static const Color gray12 = Color(0xff909090);
  static const Color gray15 = Color(0xffc4c4c4);
  static const Color gray16 = Color(0xff636363);
  static const Color gray22 = Color(0xffafafaf);
  static const Color gray23 = Color(0xffe7e7e7);
  static const Color whiteGrey = Color(0xffebebeb);
  static const Color lemon = Color(0xff69b179);
  static const Color lemon2 = Color(0xff61c577);
  static const Color lemon3 = Color(0xff3db39e);
  static const Color textGreen = Color(0xff085139);
  static const Color green = Color(0xff5acd93);
  static const Color containGreen = Color(0xffa5e1cd);
  static const Color lightWhiteGreen = Color.fromRGBO(26, 174, 120, 1);
  static const Color lemon5 = Color(0xff189A3C);
  static const Color yellow = Color(0xfff2C623);
  static const Color gold = Color(0xffFFB600);
  static const Color deepGold = Color(0xffdfac0e); //#dfac0e
  static const Color skyblue = Color(0xffa8daff);
  static const Color skyblue4 = Color(0xffdaf0ff);
  static const Color skyblue2 = Color(0xff43b0ff);
  static const Color skyblue3 = Color(0xffcae9ff);
  static const Color purple = Color(0xffc561a9);
  static const Color red = Color(0xffe81616);
  static const Color deepRed = Color(0xffe91212);
  static const Color primaryColor = Color(0xff162D4C);
  // static const Color primaryColor = Color(0xff1d3262); #162D4C
  static const Color blue = Color(0xff0D68A0);
  static const Color deepBlue = Color(0xff162D4C);
  static const Color blue2 = Color(0xff12378d);
  static const Color lemon6 = Color(0xffdbffce);
  static const Color red2 = Color(0xffffabab);
  static const Color skyBlue = Color(0xffE2F3FF);
  static const Color teal = Color(0xffDEF1FF);
  static const Color lightGrey = Color(0xffF8F8F8);
  static const Color lightblue = Color(0xff154481);
  static const Color violet = Color(0xff553b9d);
  static const Color orange = Color(0xfff27922);
  static const Color lightViolet = Color(0xfff674dbd); //674dbd
}

class AppColors {}
