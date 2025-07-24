import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class CustomEmptyCenterText extends StatelessWidget {
  const CustomEmptyCenterText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: AppStateWrapper(
        builder: (colors, texts, images) => Center(
          child: Text(
            text,
            style: AppTextStyles.urbanist.medium(
              color: colors.ff000000,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
