import 'package:athan_app/models/dua_models/hadith_info.dart';
import 'package:athan_app/models/dua_models/section_info.dart';

class DuaTranslation {
  final int? duaId;
  final String? title;
  final List<dynamic>? categoryTags;
  final String? introduction;
  final String? arabic;
  final String? audio;
  final String? transliteration;
  final String? translation;
  final String? reference;
  final HadithInfo? hadith;
  final SectionInfo? benefits;
  final SectionInfo? whenToRecite;
  final SectionInfo? howToPerform;

  DuaTranslation({
    this.duaId, this.title, this.categoryTags, this.introduction, this.arabic,
    this.audio, this.transliteration, this.translation, this.reference,
    this.hadith, this.benefits, this.whenToRecite, this.howToPerform,
  });

  factory DuaTranslation.fromJson(Map<String, dynamic> json) {
    return DuaTranslation(
      duaId: json['dua_id'],
      title: json['title'],
      categoryTags: json['category_tags'],
      introduction: json['introduction'],
      arabic: json['arabic'],
      audio: json['audio'],
      transliteration: json['transliteration'],
      translation: json['translation'],
      reference: json['reference'],
      hadith: json['hadith'] != null ? HadithInfo.fromJson(json['hadith']) : null,
      benefits: json['benefits'] != null ? SectionInfo.fromJson(json['benefits']) : null,
      whenToRecite: json['when_to_recite'] != null ? SectionInfo.fromJson(json['when_to_recite']) : null,
      howToPerform: json['how_to_perform'] != null ? SectionInfo.fromJson(json['how_to_perform']) : null,
    );
  }
}
