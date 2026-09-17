import 'dart:ui';
import 'package:athan_app/utils/generated/l10n.dart';
import 'package:athan_app/utils/app_assets.dart';
import 'package:athan_app/utils/helpers.dart';
import 'package:athan_app/utils/helpers/translator.dart';
import 'package:athan_app/utils/router/app_router.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:athan_app/views/widgets/prayer_time_widgets/bounce_top_clamp_bottom_physics.dart';
import 'package:athan_app/views/widgets/prayer_time_widgets/calender_widget.dart';
import 'package:athan_app/views/widgets/prayer_time_widgets/next_prayer_time_counter.dart';
import 'package:athan_app/views/widgets/prayer_time_widgets/prayer_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrayerPage extends StatefulWidget {
  const PrayerPage({super.key});

  @override
  State<PrayerPage> createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  Widget _buildImageIcon(BuildContext context, String assetPath) {
    final size = MediaQuery.of(context).size;
    return Image.asset(assetPath, height: size.height * 0.05);
  }

  Widget _buildCustomIconButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : AppColors.white1.withValues(alpha: 0.2),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: size.height * 0.035,
              color: AppColors.white1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final prayerCubit = BlocProvider.of<PrayerTimeCubit>(context);
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final words = S.of(context);
    final currentLocale = Localizations.localeOf(context);
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      buildWhen: (previous, current) =>
          current is FetchingTodayPrayerTimes ||
          current is FetchedTodayPrayerTimes ||
          current is FetchingTodayPrayerTimesFailed,
      builder: (context, state) {
        if (state is FetchingTodayPrayerTimes) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (state is FetchedTodayPrayerTimes) {
          final data = state.todayPrayerTimes!;
          final date = data.date!;
          final prayerTimes = data.times!;
          final nextPrayerTime = prayerCubit.getNextPrayerTime(prayerTimes);
          return Scaffold(
            backgroundColor: isDark
                ? AppColors.darkPrimaryColor
                : AppColors.primaryColor,
            body: CustomScrollView(
              physics: const BounceTopClampBottomPhysics(),
              slivers: [
                SliverAppBar(
                  expandedHeight: size.height * 0.3,
                  pinned: true,
                  backgroundColor: isDark
                      ? AppColors.black
                      : AppColors.primaryColor,
                  elevation: 0,
                  actions: [
                    _buildCustomIconButton(
                      context: context,
                      onPressed: () {},
                      icon: Icons.explore_outlined,
                    ),
                    SizedBox(width: size.width * 0.02),
                    _buildCustomIconButton(
                      context: context,
                      onPressed: () {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushNamed(AppRoutes.settings);
                      },
                      icon: Icons.settings_outlined,
                    ),
                    const SizedBox(width: 12),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          AppAssets.prayerWallpaper,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(isDark ? 0.5 : 0.2),
                        ),
                        SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 12.0,
                                  right: 12.0,
                                  bottom: 8.0,
                                  top: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: isDark
                                      ? Colors.white.withValues(alpha: 0.1)
                                      : AppColors.white1.withValues(alpha: 0.2),
                                ),
                                child: Text(
                                  words.nextPray,
                                  style: textTheme.titleMedium!.copyWith(
                                    color: AppColors.white1,
                                  ),
                                ),
                              ),
                              Text(
                                (currentLocale.languageCode == 'ar')
                                    ? Translator.arabicPrayerNames[prayerCubit
                                              .getNextPrayerName(
                                                prayerTimes,
                                              )] ??
                                          prayerCubit.getNextPrayerName(
                                            prayerTimes,
                                          )
                                    : prayerCubit.getNextPrayerName(
                                        prayerTimes,
                                      ),
                                style: textTheme.displayMedium!.copyWith(
                                  color: AppColors.white1,
                                ),
                              ),
                              Text(
                                nextPrayerTime,
                                style: textTheme.displayMedium!.copyWith(
                                  color: AppColors.white1,
                                ),
                              ),
                              NextPrayerTimeCounter(
                                targetPrayerTime: Helpers.getTimeFromString(
                                  nextPrayerTime,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.black : AppColors.white2,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: size.height * 0.01,
                      children: [
                        CalenderWidget(date: date),
                        SizedBox(height: size.height * 0.01),
                        PrayerTimeWidget(
                          icon: _buildImageIcon(context, AppAssets.fajrIcon),
                          title: words.fajr,
                          prayerTime: prayerTimes.fajr ?? '--',
                        ),
                        PrayerTimeWidget(
                          icon: _buildImageIcon(context, AppAssets.sunriseIcon),
                          title: words.Sunrise,
                          prayerTime: prayerTimes.sunrise ?? '--',
                        ),
                        PrayerTimeWidget(
                          icon: _buildImageIcon(context, AppAssets.dhuhrIcon),
                          title: words.dhuhr,
                          prayerTime: prayerTimes.dhuhr ?? '--',
                        ),
                        PrayerTimeWidget(
                          icon: _buildImageIcon(context, AppAssets.asrIcon),
                          title: words.asr,
                          prayerTime: prayerTimes.asr ?? '--',
                        ),
                        PrayerTimeWidget(
                          icon: _buildImageIcon(context, AppAssets.maghribIcon),
                          title: words.maghrib,
                          prayerTime: prayerTimes.maghrib ?? '--',
                        ),
                        PrayerTimeWidget(
                          icon: _buildImageIcon(context, AppAssets.ishaIcon),
                          title: words.isha,
                          prayerTime: prayerTimes.isha ?? '--',
                        ),
                        PrayerTimeWidget(
                          icon: _buildImageIcon(context, AppAssets.ishaIcon),
                          title: words.midnight,
                          prayerTime: prayerTimes.midnight ?? '--',
                        ),
                        PrayerTimeWidget(
                          icon: _buildImageIcon(context, AppAssets.ishaIcon),
                          title: words.lastthird,
                          prayerTime: prayerTimes.lastThird ?? '--',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is FetchingTodayPrayerTimesFailed) {
          return Scaffold(body: Center(child: ErrorWidget(state.errorMessage)));
        } else {
          return const Scaffold(body: SizedBox.shrink());
        }
      },
    );
  }
}
