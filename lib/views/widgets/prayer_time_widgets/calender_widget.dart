import 'package:athan_app/models/prayer_time_models/date_container.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatelessWidget {
  final DateContainer date;
  const CalenderWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentLocale = Localizations.localeOf(context);
    final gregorianDate = date.gregorian!;
    final hijriDate = date.hijri!;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            spreadRadius: 0.5,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(
                  '${hijriDate.day} ${currentLocale.languageCode == 'ar' ? hijriDate.month!.ar : hijriDate.month!.en}',
                  style: textTheme.titleMedium!.copyWith(fontWeight: .w600),
                ),
                Text(
                  '${hijriDate.year}',
                  style: textTheme.labelLarge!.copyWith(color: AppColors.grey1),
                ),
              ],
            ),
          ),
          VerticalDivider(
            indent: size.height * 0.018,
            endIndent: size.height * 0.018,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(
                  '${gregorianDate.day} ${currentLocale.languageCode == 'ar' ? gregorianDate.month!.ar : gregorianDate.month!.en}',
                  style: textTheme.titleMedium!.copyWith(fontWeight: .w600),
                ),
                Text(
                  '${gregorianDate.year}',
                  style: textTheme.labelLarge!.copyWith(color: AppColors.grey1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
