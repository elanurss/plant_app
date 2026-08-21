import 'package:flutter/material.dart';

import '../../core/theme/app_dimensions.dart';

class AdaptiveBody extends StatelessWidget {
  const AdaptiveBody({
    required this.child,
    this.maxWidth = AppSizes.maxContentWidth,
    this.minComfortableHeight = AppSizes.minComfortableHeight,
    super.key,
  });

  final Widget child;
  final double maxWidth;
  final double minComfortableHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxHeight >= minComfortableHeight) {
                return child;
              }

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: minComfortableHeight,
                    maxHeight: minComfortableHeight,
                  ),
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
