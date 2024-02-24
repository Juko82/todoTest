


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSize {
  static double screenHeigth = 700;
  static double size5 = screenHeigth / 143.2;
  static double size10 = screenHeigth / 71.6;
  static double size12 = screenHeigth / 59.66;
  static double size15 = screenHeigth / 47.73;
  static double size20 = screenHeigth / 35.8;
  static double size25 = screenHeigth / 28.64;
  static double size30 = screenHeigth / 23.86;
  static double size35 = screenHeigth / 20.45;
  static double size55 = screenHeigth / 14.27;
  static double size70 = screenHeigth / 10.22;
  static double size100 = screenHeigth / 7.16;
  static double size150 = screenHeigth / 4.77;
  static double size165 = screenHeigth / 4.74;
  static double size200 = screenHeigth / 3.58;
  static double size230 = screenHeigth / 3.04;
  static double size250 = screenHeigth / 2.86;
  static double size280 = screenHeigth / 2.55;
  static double size300 = screenHeigth / 2.38;
  static double size350 = screenHeigth / 2.04;


  static void init(BuildContext context) {
    screenHeigth = context.height;
  }
}
