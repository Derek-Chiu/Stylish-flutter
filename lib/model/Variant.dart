class Variant {
  final String colorCode;
  final String size;
  final int stock;

  Variant({
    required this.colorCode,
    required this.size,
    required this.stock,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      colorCode: json['color_code'],
      size: json['size'],
      stock: json['stock'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color_code': colorCode,
      'size': size,
      'stock': stock,
    };
  }
}
