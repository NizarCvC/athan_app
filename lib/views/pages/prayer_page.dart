import 'package:athan_app/utils/app_assets.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/views/widgets/prayer_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({super.key});

  Widget _buildImageIcon(BuildContext context, String assetPath) {
    final size = MediaQuery.of(context).size;
    return Image.asset(assetPath, height: size.height * 0.05);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
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
                      Text(
                        'Fajr',
                        style: textTheme.displayMedium!.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        '04:15',
                        style: textTheme.displayMedium!.copyWith(
                          color: AppColors.white,
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
                    Text('2026 july 15', style: textTheme.headlineSmall),
                    PrayerTimeWidget(
                      icon: _buildImageIcon(context, AppAssets.fajrIcon),
                      title: 'Fajr',
                      prayerTime: '04:10',
                    ),
                    PrayerTimeWidget(
                      icon: _buildImageIcon(context, AppAssets.sunriseIcon),
                      title: 'Sunrise',
                      prayerTime: '05:40',
                    ),
                    PrayerTimeWidget(
                      icon: _buildImageIcon(context, AppAssets.dhuhrIcon),
                      title: 'Dhuhr',
                      prayerTime: '12:22',
                    ),
                    PrayerTimeWidget(
                      icon: _buildImageIcon(context, AppAssets.asrIcon),
                      title: 'Asr',
                      prayerTime: '03:50',
                    ),
                    PrayerTimeWidget(
                      icon: _buildImageIcon(context, AppAssets.maghribIcon),
                      title: 'Maghrib',
                      prayerTime: '07:15',
                    ),
                    PrayerTimeWidget(
                      icon: _buildImageIcon(context, AppAssets.ishaIcon),
                      title: 'Isha',
                      prayerTime: '08:45',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
