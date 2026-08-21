import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_palette.dart';

class RemoteImage extends StatelessWidget {
  const RemoteImage({required this.url, this.fit = BoxFit.cover, super.key});

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return ColoredBox(color: context.palette.surfaceBorder);
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 200),
      placeholder: (context, _) =>
          ColoredBox(color: context.palette.surfaceBorder),
      errorWidget: (context, _, _) => ColoredBox(
        color: context.palette.surfaceBorder,
        child: Icon(
          Icons.image_not_supported_outlined,
          color: context.palette.textMuted,
        ),
      ),
    );
  }
}
