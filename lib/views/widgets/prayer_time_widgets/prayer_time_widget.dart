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
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: icon,
      title: Text(title, style: textTheme),
      trailing: SizedBox(
        width: size.width * 0.3,
        child: Row(
          mainAxisAlignment: .end,
          children: [
            Text(prayerTime, style: textTheme),
            SizedBox(width: size.width * 0.02),
          ],
        ),
      ),
    );
  }
}
