import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:small_kindness/core/consts/const_colors.dart';
import 'package:small_kindness/core/consts/const_icons_paths.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_network_image.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';
import 'package:small_kindness/features/home/presentation/widgets/home_screen_card_wd.dart';
import 'package:small_kindness/features/home/presentation/widgets/near_you_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // Top Texts Section
            appBarSection(texts, colors),
            SliverHeight(height: 15),
            // Cards Section
            cardsSection(texts, colors),
            SliverHeight(height: 10),
            // Near You Title Section
            titleSection(
              colors: colors,
              texts: texts,
              title: texts.nearYou,
              func: () {
                log("See all clicked");
              },
            ),
            // Near You Cards Section
            nearYouCardsSection(colors),
            SliverHeight(height: 10),
            // Explore Ways to Help Title Section
            titleSection(
              colors: colors,
              texts: texts,
              title: texts.exploreWaysToHelp,
              func: () {
                log("See all clicked");
              },
            ),
            // Explore Ways to Help Section
            exploreWaysToHelpSection(colors),
            SliverHeight(height: 10),
            // About Title Section
            titleSection(
              colors: colors,
              texts: texts,
              title: texts.about,
              func: () {
                log("See all clicked");
              },
            ),
            // About Section
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  textAlign: TextAlign.justify,
                  "New Home is a platform dedicated to connecting people with pets in need of homes. Our mission is to promote animal welfare and encourage responsible pet ownership through education, community engagement, and support for local shelters and rescue organizations.",
                  style: AppTextStyles.urbanist.regular(
                    color: colors.ff000000,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SliverHeight(height: 45),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter exploreWaysToHelpSection(ConstColors colors) {
    return SliverToBoxAdapter(
            child: SizedBox(
              height: 195.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => Container(
                  margin: index == 0
                      ? EdgeInsets.only(right: 15.w, left: 16.w, bottom: 10.h)
                      : index == 5
                      ? EdgeInsets.only(right: 16.w, bottom: 10.h)
                      : EdgeInsets.only(right: 15.w, bottom: 10.h),
                  height: 195.h,
                  width: 234.w,
                  decoration: BoxDecoration(
                    color: colors.ffFFFFFF,
                    borderRadius: BorderRadius.circular(9.25.r),
                  ),
                  child: Column(
                    spacing: 5.5.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.25.r),
                          child: AppNetworkImage(
                            height: 116.h,
                            width: double.infinity,
                            imageUrl:
                                "https://i.pinimg.com/1200x/29/3d/32/293d32bf6faeec6bf8718eb647a0d59a.jpg",
                          ),
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "Volunteers",
                        style: AppTextStyles.urbanist.regular(
                          color: colors.ff000000,
                          fontSize: 17.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  SliverToBoxAdapter nearYouCardsSection(ConstColors colors) {
    List<String> images = [
      "https://i.pinimg.com/1200x/29/3d/32/293d32bf6faeec6bf8718eb647a0d59a.jpg",
      "https://i.pinimg.com/1200x/37/92/08/379208d226aaa1763b88bb749b3a93af.jpg",
      "https://i.pinimg.com/736x/25/93/34/25933494ecb1254043e7db38bb73f8f8.jpg",
      "https://i.pinimg.com/736x/fd/a9/fa/fda9fa420d2748496221e9f8c1f2f112.jpg",
      "https://i.pinimg.com/736x/86/dd/3c/86dd3ced184db0b1b4b1a7a21cb111eb.jpg",
    ];
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 210.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) =>
              NearYouCard(imagesList: images, index: index),
        ),
      ),
    );
  }

  SliverPadding titleSection({
    required String title,
    required ConstColors colors,
    required ConstTexts texts,
    required VoidCallback func,
  }) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.urbanist.medium(
                color: colors.ff000000,
                fontSize: 17.sp,
              ),
            ),
            TextButton(
              onPressed: func,
              child: Text(
                texts.seeAll,
                style: AppTextStyles.urbanist.medium(
                  color: colors.ff000000,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardsSection(ConstTexts texts, ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      sliver: SliverToBoxAdapter(
        child: Column(
          spacing: 15.h,
          children: [
            Row(
              spacing: 15.w,
              children: [
                HomeScreenCard(
                  iconPath: ConstIconsPaths.paw,
                  title: texts.adotAPet,
                  content: texts.browseAnimals,
                ),
                HomeScreenCard(
                  iconPath: ConstIconsPaths.search,
                  title: texts.lostAndFound,
                  content: texts.reportLostOrFoundAnimal,
                ),
              ],
            ),
            Container(
              height: 90.h,
              width: double.infinity,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: colors.ffE8F7F6,
                borderRadius: BorderRadius.circular(5.25.r),
              ),
              child: Row(
                spacing: 12.w,
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    padding: EdgeInsets.all(9.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.25.r),
                      color: colors.ff16A99F,
                    ),
                    child: SvgPicture.asset(
                      ConstIconsPaths.article,
                      height: 25.h,
                      width: 25.w,
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                        colors.ffFFFFFF,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 2.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          texts.articles,
                          style: AppTextStyles.urbanist.medium(
                            color: colors.ff000000,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          texts.stayUpdated,
                          style: AppTextStyles.urbanist.regular(
                            color: colors.ff000000,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: colors.ff000000,
                    size: 18.r,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBarSection(ConstTexts texts, ConstColors colors) {
    return SliverAppBar(
      toolbarHeight: 70.h,
      pinned: true,
      floating: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texts.helloName,
                style: AppTextStyles.urbanist.regular(
                  color: colors.ff000000,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                texts.readyToRescue,
                style: AppTextStyles.urbanist.semiBold(
                  color: colors.ff000000,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Container(
          height: 45.h,
          width: 45.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.ffE8F7F6,
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: colors.ff000000,
            size: 25.r,
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
