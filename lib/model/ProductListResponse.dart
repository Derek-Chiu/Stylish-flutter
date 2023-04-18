import 'Product.dart';

class ProductListResponse {
  List<Product> data;
  int nextPaging;

  ProductListResponse({required this.data, required this.nextPaging});

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      data: List<Product>.from(json['data'].map((x) => Product.fromJson(x))),
      nextPaging: json['next_paging'] ?? 0,
    );
  }
}
