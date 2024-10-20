import 'package:flutter/material.dart';

class AppUtils {
  static double getSizeRespontive(BuildContext context, double size) {
    return MediaQuery.of(context).devicePixelRatio * size;
  }
}