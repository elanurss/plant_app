import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/error/app_exception.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_palette.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({required this.exception, required this.onRetry, super.key});

  final AppException exception;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: AppSpacing.xxl,
            color: context.palette.textSecondary,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            exception.message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: context.palette.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: onRetry,
            child: const Text(AppStrings.retry),
          ),
        ],
      ),
    );
  }
}
