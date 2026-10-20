import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/dua_cubit/dua_cubit.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/views/widgets/shared_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomDuaHighlightCardWidget extends StatelessWidget {
  const RandomDuaHighlightCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return BlocProvider(
      create: (context) =>
          DuaCubit(settingsCubit: settingsCubit)..fetchRandomDua(),
      child: Builder(
        builder: (context) {
          final duaCubit = context.read<DuaCubit>();
          return BlocBuilder<DuaCubit, DuaState>(
            buildWhen: (previous, current) =>
                current is FetchingRandomDua ||
                current is FetchedRandomDua ||
                current is FetchingRandomDuaFailed,
            builder: (context, state) {
              if (state is FetchingRandomDua) {
                return Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.darkPrimaryColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const LoadingWidget(),
                );
              } else if (state is FetchedRandomDua) {
                final duaTranslation = state.duaTranslation;
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.darkPrimaryColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -30,
                        bottom: -30,
                        child: Icon(
                          Icons.mosque_rounded,
                          size: 160,
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.auto_awesome,
                                        color: AppColors.accentGold,
                                        size: 15,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Featured Supplication',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {
                                    duaCubit.fetchRandomDua();
                                  },
                                  icon: const Icon(
                                    Icons.shuffle_rounded,
                                    color: Colors.white70,
                                    size: 20,
                                  ),
                                  tooltip: 'Random Dua',
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              duaTranslation.arabic ?? '',
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              duaTranslation.translation ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.85),
                                fontSize: 13.5,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    duaTranslation.reference ?? '',
                                    style: const TextStyle(
                                      color: AppColors.accentGold,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is FetchingRandomDuaFailed) {
                return Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.darkPrimaryColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ErrorWidget(state.errorMessage),
                );
              } else {
                return Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.darkPrimaryColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
