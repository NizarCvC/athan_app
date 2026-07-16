import 'package:flutter/material.dart';

class PrayerTimeWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final String prayerTime;
  final bool isNotificationActive;
  const PrayerTimeWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.prayerTime,
    this.isNotificationActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: icon,
      title: Text(title, style: textTheme.titleMedium),
      trailing: SizedBox(
        width: size.width * 0.3,
        child: Row(
          mainAxisAlignment: .end,
          children: [
            Text(prayerTime, style: textTheme.titleMedium),
            SizedBox(width: size.width * 0.02),
            IconButton(
              onPressed: () {},
              icon: Icon(
                (isNotificationActive)
                    ? Icons.notifications_active
                    : Icons.notifications_off_rounded,
                size: size.height * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
