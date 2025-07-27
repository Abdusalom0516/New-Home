import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: AppStateWrapper(
        builder: (colors, texts, images) => Center(
          child: Text(
            texts.comingSoon,
            style: AppTextStyles.urbanist.medium(
              color: colors.ff000000,
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    );
  }
}
