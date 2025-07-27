import 'package:flutter/material.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(builder: (colors, texts, images) => Scaffold());
  }
}
