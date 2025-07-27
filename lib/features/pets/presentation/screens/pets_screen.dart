import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_colors.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_coming_soon_wd.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';
import 'package:small_kindness/features/pets/presentation/widgets/category_card.dart';

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
            // Categories Section
            categoriesSection(colors, currentCategoryIndex),
            CustomComingSoonWidget(),
            SliverHeight(height: 15),
            SliverPadding(padding: EdgeInsets.symmetric(horizontal: 16.r)),
          ],
        ),
      ),
    );
  }

  SliverPadding categoriesSection(
    ConstColors colors,
    ValueNotifier<int> currentCategoryIndex,
  ) {
    return SliverPadding(
      padding: EdgeInsets.all(16.r),
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
