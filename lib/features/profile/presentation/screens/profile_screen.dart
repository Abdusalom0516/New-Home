import 'package:flutter/material.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_coming_soon_wd.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(texts.profile),
              pinned: true,
              floating: true,
              snap: true,
            ),
            CustomComingSoonWidget(),
          ],
        ),
      ),
    );
  }
}
