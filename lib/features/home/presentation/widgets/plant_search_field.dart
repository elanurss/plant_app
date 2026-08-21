import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_palette.dart';

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
          fillColor: context.palette.searchFill.withValues(alpha: 0.88),
          hintText: AppStrings.searchHint,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: context.palette.searchHint),
          prefixIcon: Icon(Icons.search, color: context.palette.searchHint),
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
