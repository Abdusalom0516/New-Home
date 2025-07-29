import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_coming_soon_wd.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';

class LostAndFoundAddScreen extends HookWidget {
  const LostAndFoundAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBar Section
            appBarSection(texts),
            SliverHeight(height: 5),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Row(
                  spacing: 13.w,
                  children: [
                    LostOrFoundCard(
                      title: texts.found,
                      image: images.found,
                      isChosen: currentIndex.value == 0,
                      func: () {
                        currentIndex.value = 0;
                      },
                    ),
                    LostOrFoundCard(
                      title: texts.lost,
                      image: images.lost,
                      isChosen: currentIndex.value == 1,
                      func: () {
                        currentIndex.value = 1;
                      },
                    ),
                  ],
                ),
              ),
            ),
            CustomComingSoonWidget(),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBarSection(ConstTexts texts) {
    return SliverAppBar(
      title: Text(texts.lostAndFoundForm),
      pinned: true,
      floating: true,
      snap: true,
    );
  }
}

class LostOrFoundCard extends StatelessWidget {
  const LostOrFoundCard({
    super.key,
    required this.image,
    required this.title,
    required this.func,
    required this.isChosen,
  });
  final String image, title;
  final VoidCallback func;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppStateWrapper(
        builder: (colors, texts, images) => InkWell(
          onTap: func,
          child: Column(
            spacing: 7.h,
            children: [
              Container(
                height: 99.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isChosen ? colors.ff000000 : colors.transparent,
                    width: 2.7.r,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.asset(
                    width: double.infinity,
                    height: 99.h,
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                title,
                style: AppTextStyles.urbanist.bold(
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
