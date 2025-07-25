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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverHeight(height: 65),
            // Top Texts Section
            topTextsSection(texts, colors),
            SliverHeight(height: 25),
            // Cards Section
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 25.r),
              sliver: SliverToBoxAdapter(
                child: Row(
                  spacing: 8.w,
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
              ),
            ),
            SliverHeight(height: 10),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 25.r),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      texts.nearYou,
                      style: AppTextStyles.urbanist.medium(
                        color: colors.ff000000,
                        fontSize: 17.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        log("See all clicked");
                      },
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
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 11,
                  itemBuilder: (context, index) => Container(
                    margin: index == 0
                        ? EdgeInsets.only(right: 15.w, left: 25.w)
                        : index == 10
                        ? EdgeInsets.only(right: 25.w)
                        : EdgeInsets.only(right: 15.w),
                    padding: EdgeInsets.all(8.r),
                    width: 154.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: colors.ffFFFFFF,
                      borderRadius: BorderRadius.circular(5.25.r),
                      border: Border.all(color: colors.ff16A99F, width: 1.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2.5.r,
                      children: [
                        Expanded(
                          flex: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.25.r),
                            child: AppNetworkImage(
                              height: 116.h,
                              width: double.infinity,
                              imageUrl:
                                  "https://i.pinimg.com/736x/86/dd/3c/86dd3ced184db0b1b4b1a7a21cb111eb.jpg",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                "Jodo",
                                style: AppTextStyles.urbanist.bold(
                                  color: colors.ff000000,
                                  fontSize: 17.sp,
                                ),
                              ),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                "Golden Retriever",
                                style: AppTextStyles.urbanist.regular(
                                  color: colors.ff000000,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding topTextsSection(ConstTexts texts, ConstColors colors) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
      sliver: SliverToBoxAdapter(
        child: Row(
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
          ],
        ),
      ),
    );
  }
}

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
            color: colors.ffE8F7F6,
            borderRadius: BorderRadius.circular(3.r),
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
                  borderRadius: BorderRadius.circular(3.r),
                  color: colors.ff16A99F,
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
