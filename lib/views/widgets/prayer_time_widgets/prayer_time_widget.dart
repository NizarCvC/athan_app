import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrayerTimeWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final String prayerTime;
  const PrayerTimeWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.prayerTime,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(
      context,
    ).textTheme.titleLarge!.copyWith(fontWeight: .w400);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: size.height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white2,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(padding: const EdgeInsets.all(6.0), child: icon),
            ),
          ),
          title: Text(title, style: textTheme),
          trailing: SizedBox(
            width: size.width * 0.3,
            child: Row(
              mainAxisAlignment: .end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white2,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      prayerTime,
                      style: textTheme.copyWith(fontWeight: .w500),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
