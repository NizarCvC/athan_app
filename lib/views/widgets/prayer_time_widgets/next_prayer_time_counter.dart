import 'dart:async';
import 'package:athan_app/utils/helpers.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NextPrayerTimeCounter extends StatefulWidget {
  final TimeOfDay targetPrayerTime;
  const NextPrayerTimeCounter({super.key, required this.targetPrayerTime});

  @override
  State<NextPrayerTimeCounter> createState() => _NextPrayerTimeCounterState();
}

class _NextPrayerTimeCounterState extends State<NextPrayerTimeCounter> {
  Timer? _timer;
  Duration _remainingTime = const Duration();
  late DateTime _targetDateTime;

  @override
  void initState() {
    super.initState();
    _calculateTargetDateTime();
    _updateRemainingTime();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _calculateTargetDateTime() {
    final now = DateTime.now();
    _targetDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      widget.targetPrayerTime.hour,
      widget.targetPrayerTime.minute,
    );

    if (_targetDateTime.isBefore(now)) {
      _targetDateTime = _targetDateTime.add(const Duration(days: 1));
    }
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    if (_targetDateTime.isAfter(now)) {
      setState(() {
        _remainingTime = _targetDateTime.difference(now);
      });
    } else {
      _timer?.cancel();
      setState(() {
        _remainingTime = Duration.zero;
      });
    }
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRemainingTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(
      context,
    ).textTheme.headlineSmall!.copyWith(color: AppColors.white);
    final hours = Helpers.formatNumber(_remainingTime.inHours);
    final minutes = Helpers.formatNumber(
      _remainingTime.inMinutes.remainder(60),
    );
    final seconds = Helpers.formatNumber(
      _remainingTime.inSeconds.remainder(60),
    );

    return Center(
      child: _remainingTime.inSeconds == 0
          ? Text('Prayer Time!', style: textTheme)
          : Text(
              '$hours:$minutes:$seconds',
              style: textTheme,
              textDirection: TextDirection.ltr,
            ),
    );
  }
}
