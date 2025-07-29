import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/consts/const_texts.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_sliver_height_wd.dart';
import 'package:small_kindness/features/articles/presentation/widgets/article_card_wd.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            // Appbar Section
            appBarSection(texts),
            SliverHeight(height: 5),
            // Articles Section
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.r),
              sliver: SliverList.builder(
                itemCount: 7,
                itemBuilder: (context, index) => ArticleCard(),
              ),
            ),
            SliverHeight(height: 15),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBarSection(ConstTexts texts) {
    return SliverAppBar(
      title: Text(texts.articles),
      pinned: true,
      floating: true,
      snap: true,
    );
  }
}
