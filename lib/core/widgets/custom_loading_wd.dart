import 'package:flutter/material.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) =>
          Center(child: CircularProgressIndicator(color: colors.ff16A99F)),
    );
  }
}
