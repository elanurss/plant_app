import 'package:flutter/material.dart';

import '../../core/theme/app_dimensions.dart';

class AdaptiveBody extends StatelessWidget {
  const AdaptiveBody({
    required this.child,
    this.maxWidth = AppSizes.maxContentWidth,
    super.key,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
