import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.homeGreeting,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
        ),
        Text(
          AppStrings.homeHeadline,
          style: textTheme.headlineMedium?.copyWith(
            fontSize: 24,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
