import 'package:flutter/material.dart';

class Helpers {
  static TimeOfDay getTimeFromString(String timeStr) {
    final time = timeStr.split(':');
    return TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1]));
  }

  static Duration getDifferenceBetweenTimes(
    TimeOfDay startTime,
    TimeOfDay endTime,
  ) {
    int startMinutes = (startTime.hour * 60) + startTime.minute;
    int endMinutes = (endTime.hour * 60) + endTime.minute;

    int diffMinutes = endMinutes - startMinutes;

    if (diffMinutes < 0) {
      diffMinutes += 24 * 60;
    }

    return Duration(minutes: diffMinutes);
  }

  static String formatNumber(int n) {
    return n.toString().padLeft(2, '0');
  }
}
