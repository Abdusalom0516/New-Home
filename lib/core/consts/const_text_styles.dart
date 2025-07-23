import 'package:flutter/widgets.dart';
import 'package:small_kindness/core/consts/const_font_names.dart';

abstract class AppTextStyles {
  static Urbanist urbanist = Urbanist();

  TextStyle regular({required Color color, required double fontSize});

  TextStyle medium({required Color color, required double fontSize});

  TextStyle bold({required Color color, required double fontSize});

  TextStyle semiBold({required Color color, required double fontSize});
}

class Urbanist extends AppTextStyles {
  @override
  TextStyle bold({required Color color, required double fontSize}) {
    return TextStyle(
      fontFamily: ConstFontNames.urbanist,
      fontWeight: FontWeight.w700,
      color: color,
      fontSize: fontSize,
    );
  }

  @override
  TextStyle medium({required Color color, required double fontSize}) {
    return TextStyle(
      fontFamily: ConstFontNames.urbanist,
      fontWeight: FontWeight.w500,
      color: color,
      fontSize: fontSize,
    );
  }

  @override
  TextStyle regular({required Color color, required double fontSize}) {
    return TextStyle(
      fontFamily: ConstFontNames.urbanist,
      fontWeight: FontWeight.w400,
      color: color,
      fontSize: fontSize,
    );
  }

  @override
  TextStyle semiBold({required Color color, required double fontSize}) {
    return TextStyle(
      fontFamily: ConstFontNames.urbanist,
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: fontSize,
    );
  }
}
