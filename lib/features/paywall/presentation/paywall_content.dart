import '../../../core/constants/app_assets.dart';

class PremiumFeature {
  const PremiumFeature({
    required this.iconAsset,
    required this.title,
    required this.subtitle,
  });

  final String iconAsset;
  final String title;
  final String subtitle;
}

class SubscriptionPlan {
  const SubscriptionPlan({
    required this.id,
    required this.title,
    required this.subtitle,
    this.badge,
  });

  final String id;
  final String title;
  final String subtitle;
  final String? badge;
}

const List<PremiumFeature> premiumFeatures = [
  PremiumFeature(
    iconAsset: AppAssets.featureScan,
    title: 'Unlimited',
    subtitle: 'Plant Identify',
  ),
  PremiumFeature(
    iconAsset: AppAssets.featureSpeed,
    title: 'Faster',
    subtitle: 'Process',
  ),
];

const List<SubscriptionPlan> subscriptionPlans = [
  SubscriptionPlan(
    id: 'monthly',
    title: '1 Month',
    subtitle: r'$2.99/month, auto renewable',
  ),
  SubscriptionPlan(
    id: 'yearly',
    title: '1 Year',
    subtitle: r'First 3 days free, then $529,99/year',
    badge: 'Save 50%',
  ),
];
