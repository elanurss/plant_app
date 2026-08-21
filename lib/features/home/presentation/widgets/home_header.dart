import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_text_styles.dart';

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
          style: textTheme.bodyLarge?.copyWith(color: context.palette.textPrimary),
        ),
        Text(
          AppStrings.homeHeadline,
          style: AppTextStyles.homeGreeting.copyWith(
            color: context.palette.textPrimary,
          ),
        ),
      ],
    );
  }
}
