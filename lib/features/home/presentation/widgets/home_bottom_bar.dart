import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({required this.onScanPressed, super.key});

  final VoidCallback onScanPressed;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return SizedBox(
      height:
          AppSizes.navBarHeight + bottomInset + AppSizes.navActionButton / 2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: AppSizes.navBarHeight + bottomInset,
            padding: EdgeInsets.only(bottom: bottomInset),
            decoration: BoxDecoration(
              color: context.palette.navSurface,
              border: Border(top: BorderSide(color: context.palette.surfaceBorder)),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: _NavItem(
                    asset: AppAssets.navHome,
                    label: AppStrings.navHome,
                    isActive: true,
                  ),
                ),
                Expanded(
                  child: _NavItem(
                    asset: AppAssets.navDiagnose,
                    label: AppStrings.navDiagnose,
                  ),
                ),
                SizedBox(width: AppSizes.navActionButton),
                Expanded(
                  child: _NavItem(
                    asset: AppAssets.navGarden,
                    label: AppStrings.navGarden,
                  ),
                ),
                Expanded(
                  child: _NavItem(
                    asset: AppAssets.navProfile,
                    label: AppStrings.navProfile,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom:
                AppSizes.navBarHeight +
                bottomInset -
                AppSizes.navActionButton / 2,
            child: _ScanButton(onPressed: onScanPressed),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.asset,
    required this.label,
    this.isActive = false,
  });

  final String asset;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : context.palette.navInactive;

    return Semantics(
      button: true,
      selected: isActive,
      label: label,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            width: AppSizes.navIcon,
            height: AppSizes.navIcon,
            color: color,
          ),
          const SizedBox(height: AppSpacing.xs),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanButton extends StatelessWidget {
  const _ScanButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Scan a plant',
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Image.asset(
          AppAssets.scanAction,
          width: AppSizes.navActionButton,
          height: AppSizes.navActionButton,
        ),
      ),
    );
  }
}
