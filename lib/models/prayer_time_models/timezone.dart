class Timezone {
  final String? name;
  final String? utcOffset;
  final String? abbreviation;

  Timezone({this.name, this.utcOffset, this.abbreviation});

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      name: json['name'],
      utcOffset: json['utc_offset'],
      abbreviation: json['abbreviation'],
    );
  }
}
