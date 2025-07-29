import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_router.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/features/articles/presentation/screens/full_article_screen.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => InkWell(
        onTap: () {
          log("Article Card Clicked.");
          AppRouter.go(FullArticleScreen());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 19.r),
          margin: EdgeInsets.only(bottom: 19.r),
          decoration: BoxDecoration(
            color: colors.ffF6F6F6,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 5.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "Why puppies are so cute? And how to teach them to poop.",
                    style: AppTextStyles.urbanist.semiBold(
                      color: colors.ff000000,
                      fontSize: 21.sp,
                    ),
                  ),
                  Text(
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    texts.lorem,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.urbanist.regular(
                      color: colors.ff000000,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    "27/07/2025",
                    style: AppTextStyles.urbanist.semiBold(
                      color: colors.ff000000,
                      fontSize: 16.sp,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: colors.ff000000,
                    size: 19.r,
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
