import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.content,
  });
  final String iconPath, title, content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppStateWrapper(
        builder: (colors, texts, images) => Container(
          height: 152.h,
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: colors.ffF6F6F6,
            borderRadius: BorderRadius.circular(5.25.r),
          ),
          child: Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                padding: EdgeInsets.all(9.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.25.r),
                  color: colors.ff000000.withValues(alpha: 0.7),
                ),
                child: SvgPicture.asset(
                  iconPath,
                  height: 25.h,
                  width: 25.w,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    colors.ffFFFFFF,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.urbanist.medium(
                      color: colors.ff000000,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    content,
                    style: AppTextStyles.urbanist.regular(
                      color: colors.ff000000,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
