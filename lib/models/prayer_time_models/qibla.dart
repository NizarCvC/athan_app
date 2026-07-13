import 'package:athan_app/models/prayer_time_models/qibla_direction.dart';
import 'package:athan_app/models/prayer_time_models/qibla_distance.dart';

class Qibla {
  final QiblaDirection? direction;
  final QiblaDistance? distance;

  Qibla({this.direction, this.distance});

  factory Qibla.fromJson(Map<String, dynamic> json) {
    return Qibla(
      direction: json['direction'] != null ? QiblaDirection.fromJson(json['direction']) : null,
      distance: json['distance'] != null ? QiblaDistance.fromJson(json['distance']) : null,
    );
  }
}
