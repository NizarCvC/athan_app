import 'package:athan_app/models/asma_ul_husna_models/allah_name.dart';

class AsmaUlHusnaData {
  final List<AllahName>? names;
  final int? total;
  final String? language;
  final String? languageCode;
  final String? title;
  final String? arabicTitle;
  final String? description;
  final String? recitationBenefits;
  final String? hadith;

  AsmaUlHusnaData({
    this.names,
    this.total,
    this.language,
    this.languageCode,
    this.title,
    this.arabicTitle,
    this.description,
    this.recitationBenefits,
    this.hadith,
  });

  factory AsmaUlHusnaData.fromJson(Map<String, dynamic> json) {
    return AsmaUlHusnaData(
      names: json['names'] != null 
          ? (json['names'] as List).map((i) => AllahName.fromJson(i)).toList() 
          : null,
      total: json['total'],
      language: json['language'],
      languageCode: json['language_code'],
      title: json['title'],
      arabicTitle: json['arabic_title'],
      description: json['description'],
      recitationBenefits: json['recitation_benefits'],
      hadith: json['hadith'],
    );
  }
}
