import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_colors.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
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
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 25.r),
              sliver: SliverToBoxAdapter(
                child: Row(
                  spacing: 8.w,
                  children: [HomeScreenCard(), HomeScreenCard()],
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
  const HomeScreenCard({super.key});

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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                  color: colors.ff16A99F,
                ),
                child: Icon(Icons.abc),
              ),
              Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    texts.adotAPet,
                    style: AppTextStyles.urbanist.medium(
                      color: colors.ff000000,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    texts.browseAnimals,
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
