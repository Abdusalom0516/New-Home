import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_colors.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_network_image.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PetDetailsScreen extends HookWidget {
  const PetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = usePageController();
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBar Section
            appBarSection(texts),
            SliverHeight(height: 16),
            // Image Section
            imageSection(imageController),
            SliverHeight(height: 16),
            // Page Indicator Section
            pageIndicatorSection(imageController, colors),
            SliverHeight(height: 5),
            // Pet Name Section
            petNameSection(colors),
            SliverHeight(height: 16),
            // Pet Info Section
            petInfoSection(texts),
            SliverHeight(height: 16),
            // Owner || Found Person Details Section
            ownerOrFoundSection(colors),
            SliverHeight(height: 16),
            // About Pet Title Section
            aboutPetTitleSection(texts, colors),
            SliverHeight(height: 16),
            // Pet Full Info Section
            petFullInfoSection(texts, colors),
            SliverHeight(height: 35),
          ],
        ),
      ),
    );
  }

  SliverPadding petFullInfoSection(ConstTexts texts, ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: Text(
          texts.lorem,
          textAlign: TextAlign.justify,
          style: AppTextStyles.urbanist.regular(
            color: colors.ff000000,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  SliverPadding aboutPetTitleSection(ConstTexts texts, ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: Text(
          texts.aboutPet,
          style: AppTextStyles.urbanist.semiBold(
            color: colors.ff000000,
            fontSize: 21.sp,
          ),
        ),
      ),
    );
  }

  SliverPadding ownerOrFoundSection(ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(11.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: colors.ffC6C6C6, width: 1.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 11.w,
                children: [
                  Container(
                    height: 47.h,
                    width: 47.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.ffF6F6F6,
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      color: colors.ff000000,
                      size: 24.r,
                    ),
                  ),
                  Column(
                    spacing: 3.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "James Parlor",
                        style: AppTextStyles.urbanist.semiBold(
                          color: colors.ff000000,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "Pet Owner",
                        style: AppTextStyles.urbanist.regular(
                          color: colors.ff000000,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                spacing: 6.w,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      log("Phone Circle Clicked.");
                    },
                    icon: Container(
                      padding: EdgeInsets.all(9.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.ffC6C6C6, width: 1.r),
                      ),
                      child: Icon(
                        Icons.phone_rounded,
                        color: colors.ff000000,
                        size: 19.r,
                      ),
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

  SliverPadding petInfoSection(ConstTexts texts) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: Row(
          spacing: 10.w,
          children: [
            PetDetailsCard(title: texts.gender, content: "Male"),
            PetDetailsCard(title: texts.age, content: "3"),
            PetDetailsCard(title: texts.size, content: "Medium"),
          ],
        ),
      ),
    );
  }

  SliverPadding petNameSection(ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
      sliver: SliverToBoxAdapter(
        child: Text(
          "Dexter",
          style: AppTextStyles.urbanist.semiBold(
            color: colors.ff000000,
            fontSize: 21.sp,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter pageIndicatorSection(
    PageController imageController,
    ConstColors colors,
  ) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothPageIndicator(
            controller: imageController,
            count: 5,
            effect: ExpandingDotsEffect(
              activeDotColor: colors.ff000000,
              dotWidth: 9.w,
              dotHeight: 9.h,
              dotColor: colors.ffE3E3E3,
            ),
            onDotClicked: (index) {},
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter imageSection(PageController imageController) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 218.h,
        child: PageView(
          controller: imageController,
          children: [
            for (int i = 0; i < 5; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.r),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8.r),
                  child: AppNetworkImage(
                    imageUrl:
                        "https://i.pinimg.com/1200x/d7/db/61/d7db619673b9d96aeaced7d4624c48c1.jpg",
                    height: 218.h,
                    width: double.infinity,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBarSection(ConstTexts texts) {
    return SliverAppBar(
      title: Text(texts.petDetails),
      pinned: true,
      floating: true,
      snap: true,
    );
  }
}

class PetDetailsCard extends StatelessWidget {
  const PetDetailsCard({super.key, required this.content, required this.title});
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppStateWrapper(
        builder: (colors, texts, images) => Container(
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 11.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: colors.ffF6F6F6,
          ),
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                title,
                style: AppTextStyles.urbanist.regular(
                  color: colors.ff000000,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                content,
                style: AppTextStyles.urbanist.semiBold(
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
