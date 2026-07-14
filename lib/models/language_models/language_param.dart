class LanguageParam {
  final String type = 'language';
  final String apiKey;

  LanguageParam({required this.apiKey});

  Map<String, dynamic> toQueryParameters() {
    final queryParams = <String, dynamic>{'type': type, 'api_key': apiKey};

    return queryParams;
  }
}
