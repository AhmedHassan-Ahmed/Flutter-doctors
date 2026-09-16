import 'package:flutter/material.dart';

class Units {
  static const double designWidth = 375;
  static const double designHeight = 812;

  static double w(BuildContext context, double value) {
    return MediaQuery.sizeOf(context).width * value / designWidth;
  }

  static double h(BuildContext context, double value) {
    return MediaQuery.sizeOf(context).height * value / designHeight;
  }

  static double textSize(BuildContext context, double value) {
    return MediaQuery.sizeOf(context).width * value / designWidth;
  }

  static double r(BuildContext context, double value) {
    return MediaQuery.sizeOf(context).width * value / designWidth;
  }
}
