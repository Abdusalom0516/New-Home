import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_img_paths.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
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
    final isDog = useState(true);
    final isCat = useState(false);
    final isOtherPet = useState(false);
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBar Section
            appBarSection(texts),
            SliverHeight(height: 15),
            // Found Or Lost Choosing Section
            foundOrLostChoosingSection(texts, images, currentIndex),
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  texts.typeOfPet,
                  style: AppTextStyles.urbanist.semiBold(
                    color: colors.ff000000,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    CheckboxRow(
                      notifier: isDog,
                      func: () {
                        isCat.value = false;
                        isOtherPet.value = false;
                        isDog.value = true;
                      },
                      title: texts.dog,
                    ),
                    CheckboxRow(
                      notifier: isCat,
                      func: () {
                        isDog.value = false;
                        isOtherPet.value = false;
                        isCat.value = true;
                      },
                      title: texts.cat,
                    ),
                    CheckboxRow(
                      notifier: isOtherPet,
                      func: () {
                        isDog.value = false;
                        isCat.value = false;
                        isOtherPet.value = true;
                      },
                      title: texts.other,
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

  SliverPadding foundOrLostChoosingSection(
    ConstTexts texts,
    ConstImgPaths images,
    ValueNotifier<int> currentIndex,
  ) {
    return SliverPadding(
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

class CheckboxRow extends StatelessWidget {
  const CheckboxRow({
    super.key,
    required this.func,
    required this.title,
    required this.notifier,
  });

  final VoidCallback func;
  final String title;
  final ValueNotifier<bool> notifier;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-12.r, 0),
      child: AppStateWrapper(
        builder: (colors, texts, images) => InkWell(
          onTap: func,
          child: Row(
            children: [
              IgnorePointer(
                ignoring: true,
                child: Checkbox.adaptive(
                  value: notifier.value,
                  activeColor: colors.ff000000,
                  onChanged: (value) {},
                ),
              ),
              Text(
                title,
                style: AppTextStyles.urbanist.medium(
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
