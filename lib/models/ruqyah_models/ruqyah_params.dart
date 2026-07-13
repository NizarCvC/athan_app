import 'package:athan_app/models/enums/asma_language.dart';
import 'package:athan_app/models/enums/ruqyah_program.dart';
import 'package:athan_app/models/enums/ruqyah_request_type.dart';
import 'package:athan_app/models/enums/ruqyah_source.dart';
import 'package:athan_app/models/enums/ruqyah_topic.dart';

class RuqyahParams {
  final RuqyahRequestType type;
  final String apiKey;
  final IslamicApiLanguage? lang;
  final RuqyahProgram? program;
  final RuqyahSource? source;
  final RuqyahTopic? topic;
  final int? id;
  final bool? random;

  RuqyahParams({
    required this.type,
    required this.apiKey,
    this.lang,
    this.program,
    this.source,
    this.topic,
    this.id,
    this.random,
  }) : assert(
          type == RuqyahRequestType.language || lang != null,
          'Language is required unless type is "language".',
        );

  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{
      'type': type.value,
      'api_key': apiKey,
    };

    if (type != RuqyahRequestType.language && lang != null) {
      params['lang'] = lang!.code;
    }

    if (program != null) params['program'] = program!.value;
    if (source != null) params['source'] = source!.value;
    if (topic != null) params['topic'] = topic!.value;
    if (id != null) params['id'] = id.toString();
    if (random != null && random == true) params['random'] = 'true';

    return params;
  }
}
