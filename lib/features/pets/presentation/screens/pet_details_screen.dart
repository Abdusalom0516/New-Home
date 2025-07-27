import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/utils/app_network_image.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class PetDetailsScreen extends HookWidget {
  const PetDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBar Section
            SliverAppBar(
              title: Text(texts.petDetails),
              pinned: true,
              floating: true,
              snap: true,
            ),
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8.r),
                child: AppNetworkImage(
                  imageUrl:
                      "https://i.pinimg.com/1200x/d7/db/61/d7db619673b9d96aeaced7d4624c48c1.jpg",
                  height: 218.h,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
