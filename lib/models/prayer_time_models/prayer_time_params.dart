import 'package:athan_app/models/enums/asr_school.dart';
import 'package:athan_app/models/enums/calculation_method.dart';
import 'package:athan_app/models/enums/calendar_method.dart';
import 'package:athan_app/models/enums/hijri_shifting.dart';

class PrayerTimeParams {
  final double lat;
  final double lon;
  final CalculationMethod? method;
  final AsrSchool? school;
  final CalendarMethod? calender; 
  final HijriShifting? shifting;
  final String? date;
  final String apiKey;

  PrayerTimeParams({
    required this.lat,
    required this.lon,
    required this.apiKey,
    this.method,
    this.school,
    this.calender,
    this.shifting,
    this.date,
  });

  Map<String, dynamic> toQueryParameters() {
    final queryParams = <String, dynamic>{
      'lat': lat.toString(),
      'lon': lon.toString(),
      'api_key': apiKey,
    };

    if (method != null) queryParams['method'] = method!.value.toString();
    if (school != null) queryParams['school'] = school!.value.toString();
    if (calender != null) queryParams['calender'] = calender!.value;
    if (shifting != null) queryParams['shifting'] = shifting!.value.toString();
    if (date != null) queryParams['date'] = date;

    return queryParams;
  }
}