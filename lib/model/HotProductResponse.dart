import 'Product.dart';

class ProductCategory {
  final String title;
  final List<Product> products;

  ProductCategory({required this.title, required this.products});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    final List<Product> productsList = (json['products'] as List<dynamic>)
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return ProductCategory(
      title: json['title'],
      products: productsList,
    );
  }
}

class ProductData {
  final List<ProductCategory> data;

  ProductData({required this.data});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    final List<ProductCategory> dataList = (json['data'] as List<dynamic>)
        .map((categoryJson) => ProductCategory.fromJson(categoryJson))
        .toList();

    return ProductData(
      data: dataList,
    );
  }
}
