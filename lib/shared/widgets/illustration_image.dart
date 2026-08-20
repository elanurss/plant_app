import 'package:flutter/material.dart';

class IllustrationImage extends StatelessWidget {
  const IllustrationImage(this.asset, {this.fit = BoxFit.cover, super.key});

  final String asset;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final logicalWidth = MediaQuery.sizeOf(context).width;
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);

    return Image.asset(
      asset,
      fit: fit,
      alignment: Alignment.bottomCenter,
      cacheWidth: (logicalWidth * pixelRatio).round(),
    );
  }
}
