import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_colors.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';
import 'package:small_kindness/features/home/presentation/widgets/near_you_card.dart';
import 'package:small_kindness/features/pets/presentation/widgets/category_card.dart';
import 'package:small_kindness/features/pets/presentation/widgets/found_card.dart';

class PetsScreen extends HookWidget {
  PetsScreen({super.key});
  final List<String> imagesList = [
    "https://i.pinimg.com/736x/1f/7d/62/1f7d622e4a700b7d46dd9f183038210d.jpg",
    "https://i.pinimg.com/736x/82/56/32/8256324f26d68b00563f301052207e88.jpg",
    "https://i.pinimg.com/736x/73/04/28/730428e55e4e21c11f8c7301652f4895.jpg",
  ];

  final List<String> imagesList2 = [
    "https://i.pinimg.com/736x/a7/b7/8a/a7b78af67c66053f70bdbf66281d5169.jpg",
    "https://i.pinimg.com/1200x/d6/81/8d/d6818dd694f3b5f4eeb470e6f28c0f51.jpg",
    "https://i.pinimg.com/736x/9b/02/76/9b0276e20ea12d7d8eb05e9a491678e8.jpg",
    "https://i.pinimg.com/736x/a7/b7/8a/a7b78af67c66053f70bdbf66281d5169.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final currentCategoryIndex = useState(0);
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBar Section
            appBarSection(
              colors: colors,
              texts: texts,
              currentCategoryIndex: currentCategoryIndex,
            ),
            SliverHeight(height: 5),
            currentCategoryIndex.value == 0
                ? SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    sliver: SliverList.builder(
                      itemCount: 11,
                      itemBuilder: (context, index) => FoundCard(),
                    ),
                  )
                : SliverToBoxAdapter(),
            currentCategoryIndex.value == 1
                ? SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    sliver: SliverGrid.builder(
                      itemCount: imagesList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 159 / 199,
                      ),
                      itemBuilder: (context, index) => NearYouCard(
                        imagesList: imagesList,
                        index: index,
                        useMargin: false,
                      ),
                    ),
                  )
                : SliverToBoxAdapter(),
            currentCategoryIndex.value == 2
                ? SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    sliver: SliverGrid.builder(
                      itemCount: imagesList2.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 159 / 199,
                      ),
                      itemBuilder: (context, index) => NearYouCard(
                        imagesList: imagesList2,
                        index: index,
                        useMargin: false,
                      ),
                    ),
                  )
                : SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBarSection({
    required ConstColors colors,
    required ConstTexts texts,
    required ValueNotifier<int> currentCategoryIndex,
  }) {
    return SliverAppBar(
      title: Text(texts.pets),
      pinned: true,
      floating: true,
      snap: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(78.h),
        child: Container(
          margin: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: colors.ffE8F7F6,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryCard(
                isSelected: currentCategoryIndex.value == 0,
                categoryName: "Found",
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
                categoryName: "Adopt",
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
}
