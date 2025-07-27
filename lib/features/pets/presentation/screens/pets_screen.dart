import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_colors.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_network_image.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';
import 'package:small_kindness/features/home/presentation/widgets/near_you_card.dart';
import 'package:small_kindness/features/pets/presentation/widgets/category_card.dart';

class PetsScreen extends HookWidget {
  PetsScreen({super.key});
  final List<String> imagesList = [
    "https://i.pinimg.com/736x/1f/7d/62/1f7d622e4a700b7d46dd9f183038210d.jpg",
    "https://i.pinimg.com/736x/82/56/32/8256324f26d68b00563f301052207e88.jpg",
    "https://i.pinimg.com/736x/73/04/28/730428e55e4e21c11f8c7301652f4895.jpg",
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

class FoundCard extends StatelessWidget {
  const FoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Container(
        height: 264.h,
        width: double.infinity,
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(bottom: 16.r),
        decoration: BoxDecoration(
          color: colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: colors.ffE0E0E0, width: 1.r),
        ),
        child: Column(
          spacing: 5.h,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: AppNetworkImage(
                  height: 125.h,
                  width: double.infinity,
                  imageUrl:
                      "https://i.pinimg.com/1200x/b1/39/70/b13970942aa917c97d358ef6582067b6.jpg",
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "Puppies",
                    style: AppTextStyles.urbanist.semiBold(
                      color: colors.ff000000,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "Found hiding under a car in the parking lot of Smith's Grocery Store",
                    style: AppTextStyles.urbanist.medium(
                      color: colors.ff000000,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: colors.ff000000,
                        size: 17.r,
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          " Found on May 26, 2024, at 10:00 AM",
                          style: AppTextStyles.urbanist.medium(
                            color: colors.ff000000,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 9.w,
                    children: [
                      Icon(
                        Icons.phone_rounded,
                        color: colors.ff000000,
                        size: 17.r,
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          "Contact: 555-987-6543 to claim",
                          style: AppTextStyles.urbanist.medium(
                            color: colors.ff000000,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
