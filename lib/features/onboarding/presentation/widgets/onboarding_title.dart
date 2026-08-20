import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_dimensions.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle(
    this.pattern, {
    this.underlineEmphasis = false,
    super.key,
  });

  final String pattern;
  final bool underlineEmphasis;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final parts = pattern.split('*');
    final spans = <InlineSpan>[];

    for (var index = 0; index < parts.length; index++) {
      final part = parts[index];
      if (part.isEmpty) continue;

      if (index.isEven) {
        spans.add(TextSpan(text: part, style: textTheme.headlineLarge));
      } else if (underlineEmphasis) {
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: _UnderlinedWord(text: part, style: textTheme.headlineMedium),
          ),
        );
      } else {
        spans.add(TextSpan(text: part, style: textTheme.headlineMedium));
      }
    }

    return Text.rich(TextSpan(children: spans));
  }
}

class _UnderlinedWord extends StatelessWidget {
  const _UnderlinedWord({required this.text, required this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Text(text, style: style),
        Positioned(
          left: 0,
          right: 0,
          bottom: -AppSizes.titleUnderlineOffset,
          child: Image.asset(AppAssets.titleUnderline, fit: BoxFit.fill),
        ),
      ],
    );
  }
}
