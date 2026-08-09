part of 'prayer_time_cubit.dart';

sealed class PrayerTimeState {}

final class PrayerTimeInitial extends PrayerTimeState {}

final class FetchingTodayPrayerTimes extends PrayerTimeState {}

final class FetchedTodayPrayerTimes extends PrayerTimeState {
  final SingleDayData? todayPrayerTimes;

  FetchedTodayPrayerTimes({required this.todayPrayerTimes});
}

final class FetchingTodayPrayerTimesFailed extends PrayerTimeState {
  final String errorMessage;

  FetchingTodayPrayerTimesFailed(this.errorMessage);
}
