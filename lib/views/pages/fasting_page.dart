import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/views/widgets/fasting_widgets/today_fasting_widget.dart';
import 'package:athan_app/views/widgets/fasting_widgets/white_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FastingPage extends StatefulWidget {
  const FastingPage({super.key});

  @override
  State<FastingPage> createState() => _FastingPageState();
}

class _FastingPageState extends State<FastingPage> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Daily Fasting',
                    style: textTheme.headlineMedium!.copyWith(
                      fontWeight: .w600,
                    ),
                  ),
                  Text(
                    'Track your fasting time',
                    style: textTheme.labelLarge!.copyWith(
                      color: AppColors.grey1,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  const TodayFastingWidget(),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.translucentGreen,
                        ),
                        child: const Icon(
                          Icons.star_border,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        'Daily Fasting',
                        style: textTheme.headlineSmall!.copyWith(
                          fontWeight: .w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                  Column(
                    spacing: size.height * 0.015,
                    children: const [
                      WhiteDayWidget(dayNumber: '13', date: '2025-08-08'),
                      WhiteDayWidget(dayNumber: '14', date: '2025-08-09'),
                      WhiteDayWidget(dayNumber: '15', date: '2025-08-10'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
