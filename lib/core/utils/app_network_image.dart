import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:small_kindness/core/utils/app_state_wrapper.dart';
import 'package:small_kindness/core/widgets/custom_loading_wd.dart';

class AppNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Widget? child;
  final String imageUrl;

  const AppNetworkImage({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.child,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        imageBuilder: (context, image) {
          return Image(image: image, fit: BoxFit.cover);
        },
        placeholder: (context, url) => CustomLoading(),
        errorWidget: (a, b, c) => Center(
          child: Icon(Icons.error, color: colors.ff16A99F, size: 34.r),
        ),
      ),
    );
  }
}
