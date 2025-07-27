import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_coming_soon_wd.dart';

class PetsScreen extends HookWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCategoryIndex = useState(0);
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBar Section
            appBarSection(texts),
            SliverPadding(
              padding: EdgeInsets.all(16.w),
              sliver: SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.ffE8F7F6,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CategoryCard(
                        isSelected: currentCategoryIndex.value == 0,
                        categoryName: "Adopt",
                        func: () {
                          currentCategoryIndex.value = 0;
                        },
                      ),
                      CategoryCard(
                        isSelected: currentCategoryIndex.value == 1,
                        categoryName: "Lost",
                        func: () {
                          currentCategoryIndex.value = 1;
                        },
                      ),
                      CategoryCard(
                        isSelected: currentCategoryIndex.value == 2,
                        categoryName: "Found",
                        func: () {
                          currentCategoryIndex.value = 2;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomComingSoonWidget(),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBarSection(ConstTexts texts) {
    return SliverAppBar(
      title: Text(texts.pets),
      pinned: true,
      floating: true,
      snap: true,
    );
  }
}

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
            padding: EdgeInsets.symmetric(vertical: 9.h),
            decoration: BoxDecoration(
              color: !isSelected ? colors.transparent : colors.ff16A99F,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                categoryName,
                style: AppTextStyles.urbanist.semiBold(
                  color: !isSelected ? colors.ff16A99F : colors.ffFFFFFF,
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
