import 'package:athan_app/utils/app_assets.dart';
import 'package:athan_app/utils/helpers.dart';
import 'package:athan_app/utils/router/app_router.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/prayer_time_cubit/prayer_time_cubit.dart';
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
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final cubit = BlocProvider.of<PrayerTimeCubit>(context);
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
            return const CircularProgressIndicator.adaptive();
          } else if (state is FetchedTodayPrayerTimes) {
            final data = state.todayPrayerTimes!;
            final date = data.date!;
            final prayerTimes = data.times!;
            final nextPrayerTime = cubit.getNextPrayerTime(prayerTimes);
            return Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
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
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.33,
                    child: Stack(
                      alignment: .center,
                      children: [
                        Image.asset(
                          AppAssets.prayerWallpaper,
                          width: double.infinity,
                          height: size.height * 0.35,
                          fit: .cover,
                        ),
                        Column(
                          mainAxisAlignment: .center,
                          children: [
                            SizedBox(height: size.height * 0.05),
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
                              cubit.getNextPrayerTime(prayerTimes),
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
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.561,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24.0),
                        topLeft: Radius.circular(24.0),
                      ),
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${date.gregorian?.year} ${date.gregorian?.month?.en} ${date.gregorian?.day}',
                                style: textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.fajrIcon),
                            title: 'Fajr',
                            prayerTime: prayerTimes.fajr ?? '--',
                          ),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(
                              context,
                              AppAssets.sunriseIcon,
                            ),
                            title: 'Sunrise',
                            prayerTime: prayerTimes.sunrise ?? '--',
                          ),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.dhuhrIcon),
                            title: 'Dhuhr',
                            prayerTime: prayerTimes.dhuhr ?? '--',
                          ),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.asrIcon),
                            title: 'Asr',
                            prayerTime: prayerTimes.asr ?? '--',
                          ),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(
                              context,
                              AppAssets.maghribIcon,
                            ),
                            title: 'Maghrib',
                            prayerTime: prayerTimes.maghrib ?? '--',
                          ),
                          PrayerTimeWidget(
                            icon: _buildImageIcon(context, AppAssets.ishaIcon),
                            title: 'Isha',
                            prayerTime: prayerTimes.isha ?? '--',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FetchingTodayPrayerTimesFailed) {
            return Center(child: ErrorWidget(state.errorMessage));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
