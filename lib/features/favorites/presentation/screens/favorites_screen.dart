import 'package:flutter/material.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(texts.favorites),
              pinned: true,
              floating: true,
              snap: true,
            ),
          ],
        ),
      ),
    );
  }
}
