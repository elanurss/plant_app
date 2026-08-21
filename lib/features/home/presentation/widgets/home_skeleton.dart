import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../shared/widgets/shimmer.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  static const int _categoryPlaceholders = 4;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: AppSpacing.screenPadding,
            child: SkeletonBox(height: AppSizes.bannerHeight),
          ),
          const SizedBox(height: AppSpacing.xl),
          SizedBox(
            height: AppSizes.questionCardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: AppSpacing.screenPadding,
              itemCount: 3,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (_, _) =>
                  const SkeletonBox(width: AppSizes.questionCardWidth),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          const Padding(
            padding: AppSpacing.screenPadding,
            child: SkeletonBox(
              width: AppSizes.skeletonTitleWidth,
              height: AppSizes.skeletonTitleHeight,
              radius: AppRadius.sm,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Padding(
            padding: AppSpacing.screenPadding,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _categoryPlaceholders,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: AppSizes.categoryAspectRatio,
              ),
              itemBuilder: (_, _) => const SkeletonBox(),
            ),
          ),
        ],
      ),
    );
  }
}
