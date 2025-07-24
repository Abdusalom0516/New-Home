import 'package:flutter/material.dart';
import 'package:small_kindness/core/widgets/custom_height_wd.dart';

class SliverHeight extends StatelessWidget {
  const SliverHeight({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Height(height: height),
    );
  }
}
