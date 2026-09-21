import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/fasting_cubit/fasting_cubit.dart';
import 'package:athan_app/views/widgets/fasting_widgets/today_fasting_widget.dart';
import 'package:athan_app/views/widgets/fasting_widgets/white_day_widget.dart';
import 'package:athan_app/views/widgets/shared_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocBuilder<FastingCubit, FastingState>(
        buildWhen: (previous, current) =>
            current is FetchingFastingInfo ||
            current is FetchedFastingInfo ||
            current is FetchingFastingInfoFailed,
        builder: (context, state) {
          if (state is FetchingFastingInfo) {
            return const Scaffold(body: Center(child: LoadingWidget()));
          } else if (state is FetchedFastingInfo) {
            final fastingInfo = state.fastingData;
            return Scaffold(
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
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: 1),
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeOutCubic,
                          builder: (context, double value, child) {
                            return Transform.translate(
                              offset: Offset(0, 30 * (1 - value)),
                              child: Opacity(opacity: value, child: child),
                            );
                          },
                          child: TodayFastingWidget(
                            fastingDay: fastingInfo.fasting![0],
                          ),
                        ),
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
                                Icons.auto_awesome_rounded,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              'Upcoming White Days',
                              style: textTheme.headlineSmall!.copyWith(
                                fontWeight: .w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.015),
                        Column(
                          spacing: size.height * 0.015,
                          children: [
                            WhiteDayWidget(
                              dayNumber: '13',
                              date: fastingInfo.whiteDays?.days?.day13 ?? '',
                            ),
                            WhiteDayWidget(
                              dayNumber: '14',
                              date: fastingInfo.whiteDays?.days?.day14 ?? '',
                            ),
                            WhiteDayWidget(
                              dayNumber: '15',
                              date: fastingInfo.whiteDays?.days?.day15 ?? '',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is FetchingFastingInfoFailed) {
            return Scaffold(
              body: Center(child: ErrorWidget(state.errorMessage)),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
