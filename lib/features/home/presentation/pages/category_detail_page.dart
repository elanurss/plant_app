import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/adaptive_body.dart';
import '../../../../shared/widgets/remote_image.dart';
import '../../domain/entities/plant_category.dart';
import '../hero_tags.dart';

@RoutePage()
class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({required this.category, super.key});

  final PlantCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: context.palette.textPrimary,
        elevation: 0,
      ),
      body: AdaptiveBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: categoryImageHeroTag(category.id),
                child: RemoteImage(
                  url: category.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: AppSpacing.screenPadding.copyWith(
                top: AppSpacing.xl,
                bottom: AppSpacing.xxl,
              ),
              child: Text(
                category.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: context.palette.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
