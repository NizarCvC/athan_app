import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/asma_ul_husna_cubit/asma_ul_husna_cubit.dart';
import 'package:athan_app/views/widgets/asma_ul_husna_widgets/allah_name_card.dart';
import 'package:athan_app/views/widgets/shared_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsmaUlHusnaPage extends StatelessWidget {
  const AsmaUlHusnaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<AsmaUlHusnaCubit, AsmaUlHusnaState>(
      buildWhen: (previous, current) =>
          current is FetchingAsmaUlHusna ||
          current is FetchedAsmaUlHusna ||
          current is FetchingAsmaUlHusnaFailed,
      builder: (context, state) {
        if (state is FetchingAsmaUlHusna) {
          return const Scaffold(body: Center(child: LoadingWidget()));
        } else if (state is FetchedAsmaUlHusna) {
          final asmaUlHusnaData = state.asmaUlHusnaData;
          final allahNames = asmaUlHusnaData.names ?? [];
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: isDark
                    ? Brightness.dark
                    : Brightness.light,
                statusBarIconBrightness: isDark
                    ? Brightness.light
                    : Brightness.dark,
              ),
              title: const Text(
                'Asma-ul-Husna',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.primaryColor,
                                AppColors.darkPrimaryColor,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.format_quote_rounded,
                                    color: AppColors.accentGold,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Prophetic Hadith',
                                    style: TextStyle(
                                      color: AppColors.accentGold,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                asmaUlHusnaData.hadith ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.5,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.95,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final allahName = allahNames[index];
                      return AllahNameCard(allahName: allahName);
                    }, childCount: allahNames.length),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            ),
          );
        } else if (state is FetchingAsmaUlHusnaFailed) {
          return Scaffold(body: Center(child: ErrorWidget(state.message)));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
