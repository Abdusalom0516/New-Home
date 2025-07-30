import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_img_paths.dart';
import 'package:small_kindness/core/consts/const_text_styles.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';
import 'package:small_kindness/core/widgets/custom_text_button_wd.dart';
import 'package:small_kindness/features/add/presentation/widgets/lost_or_found_card_wd.dart';

class LostAndFoundAddScreen extends HookWidget {
  const LostAndFoundAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final isDog = useState(true);
    final isCat = useState(false);
    final isOtherPet = useState(false);
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final contacController = useTextEditingController();
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(16.r, 0, 16.r, 22.r),

          child: Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  buttonText: texts.submit,
                  textColor: colors.ffFFFFFF,
                  backgroundColor: colors.ff000000,
                  func: () {},
                ),
              ),
            ],
          ),
        ),
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
            SliverHeight(height: 10),
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
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  texts.name,
                  style: AppTextStyles.urbanist.semiBold(
                    color: colors.ff000000,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SliverHeight(height: 10),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  controller: nameController,
                  style: AppTextStyles.urbanist.medium(
                    color: colors.ff848484,
                    fontSize: 14.sp,
                  ),
                  cursorColor: colors.ff000000,
                  decoration: InputDecoration(
                    hint: Text(
                      "Enter pet name... (e.g. Dexter)",
                      style: AppTextStyles.urbanist.medium(
                        color: colors.ff848484,
                        fontSize: 14.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ),
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  texts.description,
                  style: AppTextStyles.urbanist.semiBold(
                    color: colors.ff000000,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SliverHeight(height: 10),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  maxLines: 4,
                  controller: descriptionController,
                  style: AppTextStyles.urbanist.medium(
                    color: colors.ff848484,
                    fontSize: 14.sp,
                  ),
                  cursorColor: colors.ff000000,
                  decoration: InputDecoration(
                    hint: Text(
                      "Please describe your lost pet (e.g., breed, color, size, distinctive markings)",
                      style: AppTextStyles.urbanist.medium(
                        color: colors.ff848484,
                        fontSize: 14.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ),
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  texts.dateAndTime,
                  style: AppTextStyles.urbanist.semiBold(
                    color: colors.ff000000,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SliverHeight(height: 10),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  controller: nameController,
                  style: AppTextStyles.urbanist.medium(
                    color: colors.ff848484,
                    fontSize: 14.sp,
                  ),
                  cursorColor: colors.ff000000,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                      color: colors.ff000000,
                      size: 21.r,
                    ),
                    hint: Text(
                      texts.dateAndTimeHint,
                      style: AppTextStyles.urbanist.medium(
                        color: colors.ff848484,
                        fontSize: 14.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ),
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  texts.location,
                  style: AppTextStyles.urbanist.semiBold(
                    color: colors.ff000000,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SliverHeight(height: 10),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  controller: nameController,
                  style: AppTextStyles.urbanist.medium(
                    color: colors.ff848484,
                    fontSize: 14.sp,
                  ),
                  cursorColor: colors.ff000000,
                  decoration: InputDecoration(
                    hint: Text(
                      texts.locationHint,
                      style: AppTextStyles.urbanist.medium(
                        color: colors.ff848484,
                        fontSize: 14.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ),
            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  texts.contactInfo,
                  style: AppTextStyles.urbanist.semiBold(
                    color: colors.ff000000,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),

            SliverHeight(height: 10),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  controller: contacController,
                  style: AppTextStyles.urbanist.medium(
                    color: colors.ff848484,
                    fontSize: 14.sp,
                  ),
                  cursorColor: colors.ff000000,
                  decoration: InputDecoration(
                    hint: Text(
                      texts.yourPhoneNumber,
                      style: AppTextStyles.urbanist.medium(
                        color: colors.ff848484,
                        fontSize: 14.sp,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.ff848484),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ),

            SliverHeight(height: 15),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Text(
                  texts.uploadPhoto,
                  style: AppTextStyles.urbanist.semiBold(
                    color: colors.ff000000,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SliverHeight(height: 10),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 74.r,
                        width: 74.r,
                        decoration: BoxDecoration(
                          color: colors.ffF6F6F6,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: colors.ff848484,
                            width: 0.9.r,
                          ),
                        ),
                        child: Icon(
                          Icons.add_rounded,
                          size: 24.r,
                          color: colors.ff000000,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverHeight(height: 35),
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
