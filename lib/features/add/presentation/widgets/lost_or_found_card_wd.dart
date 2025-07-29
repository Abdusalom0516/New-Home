import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class LostOrFoundCard extends StatelessWidget {
  const LostOrFoundCard({
    super.key,
    required this.image,
    required this.title,
    required this.func,
    required this.isChosen,
  });
  final String image, title;
  final VoidCallback func;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppStateWrapper(
        builder: (colors, texts, images) => InkWell(
          onTap: func,
          child: Column(
            spacing: 7.h,
            children: [
              Container(
                height: 99.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isChosen ? colors.ff000000 : colors.transparent,
                    width: 2.7.r,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.asset(
                    width: double.infinity,
                    height: 99.h,
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                title,
                style: AppTextStyles.urbanist.bold(
                  color: colors.ff000000,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
