import 'package:flutter/material.dart';
import 'package:testing_app/core/constants/app_color.dart';
import 'package:testing_app/utils/size/app_size.dart';

abstract class ThemeApp {
  static final ThemeData ligthThem = ThemeData(
    cardColor: ColorsApp.white,
     hintColor: ColorsApp.grey,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.white),
    scaffoldBackgroundColor: ColorsApp.white,
    textTheme: TextTheme(
      labelMedium: const TextStyle(color: ColorsApp.black),
      labelSmall: TextStyle(color: ColorsApp.lightBlack, fontSize: AppSize.size15),
      titleMedium: TextStyle(color: ColorsApp.lightBlack, fontSize: AppSize.size20),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: ColorsApp.blue),
    useMaterial3: true,
  );
  static final ThemeData darkTheme = ThemeData(
    cardColor: ColorsApp.grey,
    hintColor: ColorsApp.white,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.lightBlack),
    textTheme:  TextTheme(
        labelMedium: const TextStyle(color: ColorsApp.black),
        labelSmall: TextStyle(color: ColorsApp.white, fontSize: AppSize.size15),
        titleMedium: TextStyle(color: ColorsApp.white, fontSize: AppSize.size20)),
    scaffoldBackgroundColor: ColorsApp.lightBlack,
    appBarTheme: AppBarTheme(backgroundColor: ColorsApp.lightBlack),
    useMaterial3: true,
  );
}
