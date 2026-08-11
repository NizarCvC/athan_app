import 'package:athan_app/utils/app_assets.dart';
import 'package:athan_app/utils/helpers.dart';
import 'package:athan_app/utils/router/app_router.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:athan_app/views/widgets/prayer_time_widgets/bounce_top_clamp_bottom_physics.dart';
import 'package:athan_app/views/widgets/prayer_time_widgets/next_prayer_time_counter.dart';
import 'package:athan_app/views/widgets/prayer_time_widgets/prayer_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = BlocProvider.of<PrayerTimeCubit>(context);
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
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
            final nextPrayerTime = cubit.getNextPrayerTime(prayerTimes);
            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: CustomScrollView(
                physics: const BounceTopClampBottomPhysics(),
                slivers: [
                  SliverAppBar(
                    expandedHeight: size.height * 0.3,
                    pinned: true,
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.white.withOpacity(0.9),
                        ),
                        icon: const Icon(
                          Icons.explore_outlined,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: size.width * 0.005),
                      IconButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                            rootNavigator: true,
                          ).pushNamed(AppRoutes.settings);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.white.withOpacity(0.9),
                        ),
                        icon: const Icon(
                          Icons.settings,
                          color: AppColors.primaryColor,
                        ),
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
                          Container(color: Colors.black.withOpacity(0.2)),
                          SafeArea(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next Pray',
                                  style: textTheme.titleLarge!.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  cubit.getNextPrayerName(prayerTimes),
                                  style: textTheme.displayMedium!.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  nextPrayerTime,
                                  style: textTheme.displayMedium!.copyWith(
                                    color: AppColors.white,
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
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
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
                        children: [
                          Text(
                            '${date.gregorian?.year} ${date.gregorian?.month?.en} ${date.gregorian?.day}',
                            style: textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 16),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.fajrIcon),
                            title: 'Fajr',
                            prayerTime: prayerTimes.fajr ?? '--',
                          ),
                          const SizedBox(height: 8),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(
                              context,
                              AppAssets.sunriseIcon,
                            ),
                            title: 'Sunrise',
                            prayerTime: prayerTimes.sunrise ?? '--',
                          ),
                          const SizedBox(height: 8),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.dhuhrIcon),
                            title: 'Dhuhr',
                            prayerTime: prayerTimes.dhuhr ?? '--',
                          ),
                          const SizedBox(height: 8),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.asrIcon),
                            title: 'Asr',
                            prayerTime: prayerTimes.asr ?? '--',
                          ),
                          const SizedBox(height: 8),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(
                              context,
                              AppAssets.maghribIcon,
                            ),
                            title: 'Maghrib',
                            prayerTime: prayerTimes.maghrib ?? '--',
                          ),
                          const SizedBox(height: 8),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.ishaIcon),
                            title: 'Isha',
                            prayerTime: prayerTimes.isha ?? '--',
                          ),
                          const SizedBox(height: 8),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.ishaIcon),
                            title: 'Midnight',
                            prayerTime: prayerTimes.midnight ?? '--',
                          ),
                          const SizedBox(height: 8),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.ishaIcon),
                            title: 'Last Third',
                            prayerTime: prayerTimes.lastThird ?? '--',
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FetchingTodayPrayerTimesFailed) {
            return Scaffold(
              body: Center(child: ErrorWidget(state.errorMessage)),
            );
          } else {
            return const Scaffold(body: SizedBox.shrink());
          }
        },
      ),
    );
  }
}
