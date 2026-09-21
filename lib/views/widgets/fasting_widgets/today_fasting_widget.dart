import 'package:athan_app/models/fasting_models/fasting_day.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/views/widgets/fasting_widgets/glass_container.dart';
import 'package:athan_app/views/widgets/shared_widgets/custom_vertical_divider.dart';
import 'package:flutter/material.dart';

class TodayFastingWidget extends StatelessWidget {
  final FastingDay fastingDay;

  const TodayFastingWidget({super.key, required this.fastingDay});

  Widget _buildTimeWithTitle({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String time,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.yellow),
            SizedBox(width: size.width * 0.01),
            Text(
              title,
              style: textTheme.titleSmall!.copyWith(color: AppColors.white1),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          time,
          style: textTheme.headlineMedium!.copyWith(
            color: AppColors.white1,
            fontWeight: .w800,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisSize: .min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.black12,
                  ),
                  child: Row(
                    mainAxisAlignment: .center,
                    children: [
                      const Icon(Icons.calendar_month, color: AppColors.yellow),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        fastingDay.hijriReadable ?? '',
                        style: textTheme.titleMedium!.copyWith(
                          color: AppColors.white1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.mosque,
                  size: size.height * 0.04,
                  color: AppColors.white1.withValues(alpha: 0.3),
                ),
                SizedBox(width: size.width * 0.01),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            GlassContainer(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        _buildTimeWithTitle(
                          context: context,
                          title: 'Suhoor',
                          icon: Icons.nightlight_round,
                          time: fastingDay.time?.sahur ?? '',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.0),
                          child: CustomVerticalDivider(),
                        ),
                        _buildTimeWithTitle(
                          context: context,
                          title: 'Iftar',
                          icon: Icons.sunny,
                          time: fastingDay.time?.iftar ?? '',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: .center,
              children: [
                const Icon(
                  Icons.hourglass_empty_rounded,
                  color: AppColors.yellow,
                ),
                SizedBox(width: size.width * 0.015),
                Text(
                  'Total Duration: ${fastingDay.time?.duration ?? ''}',
                  style: textTheme.titleMedium!.copyWith(
                    color: AppColors.white1,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.003),
          ],
        ),
      ),
    );
  }
}
