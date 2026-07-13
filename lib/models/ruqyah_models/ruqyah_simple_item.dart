class RuqyahSimpleItem {
  final String? id;
  final String? title;

  RuqyahSimpleItem({this.id, this.title});

  factory RuqyahSimpleItem.fromJson(Map<String, dynamic> json) {
    return RuqyahSimpleItem(
      id: json['id']?.toString(),
      title: json['title'],
    );
  }
}
