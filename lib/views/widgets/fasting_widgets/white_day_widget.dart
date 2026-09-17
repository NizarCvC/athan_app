import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WhiteDayWidget extends StatelessWidget {
  final String date;
  final String dayNumber;
  const WhiteDayWidget({
    super.key,
    required this.date,
    required this.dayNumber,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.white1,
      ),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.04),
          Container(
            height: size.width * 0.14,
            width: size.width * 0.14,
            decoration: BoxDecoration(
              color: AppColors.translucentGreen.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: AppColors.primaryColor.withValues(alpha: 0.3),
                width: 1.2,
              ),
            ),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(
                  dayNumber,
                  style: textTheme.titleLarge!.copyWith(
                    fontWeight: .w900,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  'Day',
                  style: textTheme.labelMedium!.copyWith(
                    fontWeight: .w900,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: size.width * 0.03),
          Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: [
              Text(
                '${dayNumber}th Day',
                style: textTheme.titleMedium!.copyWith(fontWeight: .w600),
              ),
              SizedBox(width: size.width * 0.01),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    size: size.height * 0.025,
                    color: AppColors.grey1,
                  ),
                  SizedBox(width: size.width * 0.01),
                  Text(date),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
