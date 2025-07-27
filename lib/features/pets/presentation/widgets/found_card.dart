import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_network_image.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
