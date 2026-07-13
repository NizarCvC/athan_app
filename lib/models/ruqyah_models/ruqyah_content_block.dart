class RuqyahContentBlock {
  final String? type;
  final String? content;

  RuqyahContentBlock({this.type, this.content});

  factory RuqyahContentBlock.fromJson(Map<String, dynamic> json) {
    return RuqyahContentBlock(
      type: json['type'],
      content: json['content'],
    );
  }
}
