import 'package:flutter/material.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class FullArticleScreen extends StatelessWidget {
  const FullArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) =>
          Scaffold(body: CustomScrollView(slivers: [
          
        ],
      )),
    );
  }
}
