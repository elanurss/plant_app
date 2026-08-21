import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../shared/widgets/app_error_view.dart';
import '../bloc/home_bloc.dart';
import '../widgets/category_card.dart';
import '../widgets/home_bottom_bar.dart';
import '../widgets/home_header.dart';
import '../widgets/home_skeleton.dart';
import '../widgets/plant_search_field.dart';
import '../widgets/premium_banner.dart';
import '../widgets/question_card.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _bloc = getIt<HomeBloc>()..add(const HomeStarted());

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: _bloc,
      child: Scaffold(
        extendBody: true,
        backgroundColor: context.palette.background,
        body: const SafeArea(bottom: false, child: _HomeBody()),
        bottomNavigationBar: HomeBottomBar(onScanPressed: () {}),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  Future<void> _openQuestion(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return;
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.hasFailed && state.error != null) {
          return AppErrorView(
            exception: state.error!,
            onRetry: () => bloc.add(const HomeRefreshed()),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => bloc.add(const HomeRefreshed()),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ClipRect(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          AppAssets.homeHeaderLeaves,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Padding(
                        padding: AppSpacing.screenPadding.copyWith(
                          top: AppSpacing.xl,
                          bottom: AppSpacing.xl,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const HomeHeader(),
                            const SizedBox(height: AppSpacing.xl),
                            PlantSearchField(
                              onChanged: (query) =>
                                  bloc.add(HomeSearchChanged(query)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: AppSpacing.screenPadding.copyWith(
                  bottom: AppSpacing.xl,
                ),
                sliver: SliverToBoxAdapter(child: PremiumBanner(onTap: () {})),
              ),
              if (state.isLoading)
                const SliverToBoxAdapter(child: HomeSkeleton())
              else ...[
                SliverToBoxAdapter(
                  child: _QuestionCarousel(
                    state: state,
                    onQuestionTap: _openQuestion,
                  ),
                ),
                SliverPadding(
                  padding: AppSpacing.screenPadding.copyWith(
                    top: AppSpacing.xl,
                    bottom: AppSpacing.sm,
                  ),
                  sliver: const SliverToBoxAdapter(child: _SectionTitle()),
                ),
                _CategoryGrid(state: state),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.categoriesSection,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontSize: 20,
        color: context.palette.textPrimary,
      ),
    );
  }
}

class _QuestionCarousel extends StatelessWidget {
  const _QuestionCarousel({required this.state, required this.onQuestionTap});

  final HomeState state;
  final Future<void> Function(String url) onQuestionTap;

  @override
  Widget build(BuildContext context) {
    if (state.questions.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: AppSizes.questionCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: AppSpacing.screenPadding,
        itemCount: state.questions.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (context, index) {
          final question = state.questions[index];
          return QuestionCard(
            question: question,
            onTap: () => unawaited(onQuestionTap(question.url)),
          );
        },
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final categories = state.visibleCategories;

    if (categories.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: AppSpacing.screenPadding.copyWith(top: AppSpacing.xxxl),
          child: Text(
            AppStrings.emptyCategories,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: context.palette.textSecondary,
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: AppSpacing.screenPadding.copyWith(
        bottom:
            AppSizes.navBarHeight +
            AppSizes.navActionButton / 2 +
            MediaQuery.viewPaddingOf(context).bottom +
            AppSpacing.lg,
      ),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppSpacing.lg,
          mainAxisSpacing: AppSpacing.lg,
          childAspectRatio: AppSizes.categoryAspectRatio,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryCard(
            category: category,
            onTap: () => unawaited(
              context.router.push(CategoryDetailRoute(category: category)),
            ),
          );
        },
      ),
    );
  }
}
