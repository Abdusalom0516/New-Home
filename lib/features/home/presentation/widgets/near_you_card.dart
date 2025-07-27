import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/utils/app_network_image.dart';
import 'package:small_kindness/core/utils/app_router.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/features/pets/presentation/screens/pet_details_screen.dart';

class NearYouCard extends StatelessWidget {
  const NearYouCard({
    super.key,
    required this.imagesList,
    required this.index,
    this.useMargin,
  });

  final List<String> imagesList;
  final int index;
  final bool? useMargin;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => InkWell(
        onTap: () {
          AppRouter.go(PetDetailsScreen());
        },
        child: Card(
          elevation: 0.5.r,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.25.r),
          ),
          margin: useMargin == true
              ? index == 0
                    ? EdgeInsets.only(right: 15.r, left: 16.r, bottom: 10.r)
                    : index == (imagesList.length - 1)
                    ? EdgeInsets.only(right: 16.r, bottom: 10.r)
                    : EdgeInsets.only(right: 15.r, bottom: 10.r)
              : null,
          child: Container(
            padding: EdgeInsets.all(8.r),
            width: 154.w,
            height: 200.h,
            decoration: BoxDecoration(
              color: colors.ffFFFFFF,
              borderRadius: BorderRadius.circular(9.25.r),
              border: Border.all(color: colors.ffE3E3E3, width: 1.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2.5.r,
              children: [
                Expanded(
                  flex: 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.25.r),
                    child: AppNetworkImage(
                      height: 116.h,
                      width: double.infinity,
                      imageUrl: imagesList[index],
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
    );
  }
}
