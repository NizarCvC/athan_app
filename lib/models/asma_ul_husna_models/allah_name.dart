class AllahName {
  final int? number;
  final String? name; 
  final String? transliteration; 
  final String? translation; 
  final String? meaning; 
  final String? audio;

  AllahName({
    this.number,
    this.name,
    this.transliteration,
    this.translation,
    this.meaning,
    this.audio,
  });

  factory AllahName.fromJson(Map<String, dynamic> json) {
    return AllahName(
      number: json['number'],
      name: json['name'],
      transliteration: json['transliteration'],
      translation: json['translation'],
      meaning: json['meaning'],
      audio: json['audio'],
    );
  }
}
