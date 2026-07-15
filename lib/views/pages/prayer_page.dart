import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/views/widgets/prayer_time_widget.dart';
import 'package:flutter/material.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          const Spacer(),
          Container(
            height: size.height * 0.55,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.0),
                topLeft: Radius.circular(16.0),
              ),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text(
                    '2026 july 15',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const PrayerTimeWidget(
                    icon: Icon(Icons.mode_night_outlined),
                    title: 'Fajr',
                    prayerTime: '04:10',
                  ),
                  const PrayerTimeWidget(
                    icon: Icon(Icons.mode_night_outlined),
                    title: 'Sunrise',
                    prayerTime: '05:40',
                  ),
                  const PrayerTimeWidget(
                    icon: Icon(Icons.mode_night_outlined),
                    title: 'Dhuhr',
                    prayerTime: '12:22',
                  ),
                  const PrayerTimeWidget(
                    icon: Icon(Icons.mode_night_outlined),
                    title: 'Asr',
                    prayerTime: '03:50',
                  ),
                  const PrayerTimeWidget(
                    icon: Icon(Icons.mode_night_outlined),
                    title: 'Maghrib',
                    prayerTime: '07:15',
                  ),
                  const PrayerTimeWidget(
                    icon: Icon(Icons.mode_night_outlined),
                    title: 'Isha',
                    prayerTime: '08:45',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
