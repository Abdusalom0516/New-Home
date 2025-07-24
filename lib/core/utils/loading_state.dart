import 'package:flutter/material.dart';
import 'package:small_kindness/core/consts/const_colors.dart';

Future<dynamic> loadingState(BuildContext context, ConstColors colors) {
  return showDialog(
    barrierDismissible: false,
    barrierColor: colors.ff000000.withValues(alpha: 0.2),
    context: context,
    builder: (context) =>
        Center(child: CircularProgressIndicator(color: colors.ff16A99F)),
  );
}
