import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class LegalNotice extends StatelessWidget {
  const LegalNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(
      context,
    ).textTheme.labelSmall?.copyWith(color: AppColors.textMuted);

    final link = base?.copyWith(
      decoration: TextDecoration.underline,
      decorationColor: AppColors.textMuted,
    );

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: AppStrings.legalPrefix, style: base),
          TextSpan(text: AppStrings.termsOfUse, style: link),
          TextSpan(text: AppStrings.legalSeparator, style: base),
          TextSpan(text: AppStrings.privacyPolicy, style: link),
          TextSpan(text: '.', style: base),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
