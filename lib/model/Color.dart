class Color {
  final String code;
  final String name;

  Color({required this.code, required this.name});

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
    };
  }
}
