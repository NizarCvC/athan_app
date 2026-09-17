import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/views/widgets/fasting_widgets/glass_container.dart';
import 'package:flutter/material.dart';

class TodayFastingWidget extends StatelessWidget {
  const TodayFastingWidget({super.key});

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
              children: [
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.5,
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
                        '29 ramadan 1448',
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
                          icon: Icons.nightlight,
                          time: '4:04 AM',
                        ),
                        Expanded(
                          child: VerticalDivider(
                            radius: BorderRadius.circular(24.0),
                            color: AppColors.white1.withAlpha(100),
                          ),
                        ),
                        _buildTimeWithTitle(
                          context: context,
                          title: 'Iftar',
                          icon: Icons.sunny,
                          time: '6:53 PM',
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
                const Icon(Icons.timer_sharp, color: AppColors.yellow),
                SizedBox(width: size.width * 0.015),
                Text(
                  'Total Duration: 14 hours 49 minutes',
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
