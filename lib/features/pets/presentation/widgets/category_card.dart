import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.isSelected,
    required this.func,
  });
  final String categoryName;
  final bool isSelected;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppStateWrapper(
        builder: (colors, texts, images) => TextButton(
          onPressed: func,
          style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 9.r),
            decoration: BoxDecoration(
              color: !isSelected
                  ? colors.transparent
                  : colors.ff000000.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                categoryName,
                style: AppTextStyles.urbanist.semiBold(
                  color: !isSelected ? colors.ff000000 : colors.ffFFFFFF,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
