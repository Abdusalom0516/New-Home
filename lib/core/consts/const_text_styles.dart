import 'package:flutter/widgets.dart';

abstract class AppTextStyles {

  TextStyle regular({required Color color, required double fontSize});

  TextStyle medium({required Color color, required double fontSize});

  TextStyle bold({required Color color, required double fontSize});

  TextStyle semiBold({required Color color, required double fontSize});
}