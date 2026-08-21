import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';

class PlantSearchField extends StatelessWidget {
  const PlantSearchField({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.searchFieldHeight,
      child: TextField(
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.searchFill.withValues(alpha: 0.88),
          hintText: AppStrings.searchHint,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.searchHint),
          prefixIcon: const Icon(Icons.search, color: AppColors.searchHint),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
