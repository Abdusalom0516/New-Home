import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_coming_soon_wd.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';
import 'package:small_kindness/features/add/presentation/widgets/lost_or_found_card_wd.dart';

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
