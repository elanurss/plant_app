import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.colors,
    this.style,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    super.key,
  });

  final String text;
  final List<Color> colors;
  final TextStyle? style;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
      ).createShader(bounds),
      child: Text(
        text,
        style: (style ?? const TextStyle()).copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
