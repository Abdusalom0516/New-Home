import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_colors.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_network_image.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_height_wd.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';

class FullArticleScreen extends HookWidget {
  const FullArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBarSection
            appBarSection(texts),
            SliverHeight(height: 5),
            // Article Section
            articleSection(scrollController, colors, texts),
          ],
        ),
      ),
    );
  }

  SliverPadding articleSection(
    ScrollController scrollController,
    ConstColors colors,
    ConstTexts texts,
  ) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.only(left: 16.r, right: 7.r),
      sliver: SliverFillRemaining(
        child: Scrollbar(
          controller: scrollController,
          interactive: true,
          radius: Radius.circular(8.r),

          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsetsGeometry.only(right: 9.r),
              child: Column(
                children: [
                  Text(
                    '"Why puppies are so cute? How to teach them to poop?"',
                    style: AppTextStyles.urbanist.semiBold(
                      color: colors.ff000000,
                      fontSize: 21.sp,
                    ),
                  ),
                  Height(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8.r),
                    child: AppNetworkImage(
                      imageUrl:
                          "https://i.pinimg.com/1200x/2c/a3/e9/2ca3e90e40e4b10ddb1ed04340eb453b.jpg",
                      height: 200.h,
                      width: double.infinity,
                    ),
                  ),
                  Height(height: 15),
                  Text(
                    texts.lorem +
                        texts.lorem +
                        texts.lorem +
                        texts.lorem +
                        texts.lorem +
                        texts.lorem,
                    style: AppTextStyles.urbanist.regular(
                      color: colors.ff000000,
                      fontSize: 16.sp,
                    ),
                  ),
                  Height(height: 25),
                  Row(
                    children: [
                      Text(
                        "29/07/2025",
                        style: AppTextStyles.urbanist.semiBold(
                          color: colors.ff000000,
                          fontSize: 19.sp,
                        ),
                      ),
                    ],
                  ),
                  Height(height: 45),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar appBarSection(ConstTexts texts) {
    return SliverAppBar(
      title: Text(texts.article),
      pinned: true,
      floating: true,
      snap: true,
    );
  }
}
