class DuaCategory {
  final String? name;
  final String? url;
  final String? icon;
  final String? meta;

  DuaCategory({this.name, this.url, this.icon, this.meta});

  factory DuaCategory.fromJson(Map<String, dynamic> json) {
    return DuaCategory(
      name: json['name'],
      url: json['url'],
      icon: json['icon'],
      meta: json['meta'],
    );
  }
}
