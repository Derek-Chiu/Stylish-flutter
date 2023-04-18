import 'Color.dart';
import 'Variant.dart';
import 'Product.dart';

class ProductListResponse {
  List<Product> data;
  int nextPaging;

  ProductListResponse({required this.data, required this.nextPaging});

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      data: List<Product>.from(json['data'].map((x) => Product.fromJson(x))),
      nextPaging: json['next_paging'],
    );
  }
}

// class Product {
//   int id;
//   String category;
//   String title;
//   String description;
//   int price;
//   String texture;
//   String wash;
//   String place;
//   String note;
//   String story;
//   List<Color> colors;
//   List<String> sizes;
//   List<Variant> variants;
//   String mainImage;
//   List<String> images;

//   Product({
//     required this.id,
//     required this.category,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.texture,
//     required this.wash,
//     required this.place,
//     required this.note,
//     required this.story,
//     required this.colors,
//     required this.sizes,
//     required this.variants,
//     required this.mainImage,
//     required this.images,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       category: json['category'],
//       title: json['title'],
//       description: json['description'],
//       price: json['price'],
//       texture: json['texture'],
//       wash: json['wash'],
//       place: json['place'],
//       note: json['note'],
//       story: json['story'],
//       colors: List<Color>.from(json['colors'].map((x) => Color.fromJson(x))),
//       sizes: List<String>.from(json['sizes'].map((x) => x)),
//       variants:
//           List<Variant>.from(json['variants'].map((x) => Variant.fromJson(x))),
//       mainImage: json['main_image'],
//       images: List<String>.from(json['images'].map((x) => x)),
//     );
//   }
// }
