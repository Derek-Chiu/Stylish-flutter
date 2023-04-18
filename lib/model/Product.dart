import 'Variant.dart';
import 'Color.dart';

class Product {
  final int id;
  final String category;
  final String title;
  final String description;
  final int price;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<Color> colors;
  final List<String> sizes;
  final List<Variant> variants;
  final String mainImage;
  final List<String> images;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.texture,
    required this.wash,
    required this.place,
    required this.note,
    required this.story,
    required this.colors,
    required this.sizes,
    required this.variants,
    required this.mainImage,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    final colors = (data['colors'] as List<dynamic>).map((color) {
      return Color.fromJson(color);
    }).toList();
    final sizes = (data['sizes'] as List<dynamic>)
        .map((size) => size.toString())
        .toList();
    final variants = (data['variants'] as List<dynamic>).map((variant) {
      return Variant.fromJson(variant);
    }).toList();
    final images = (data['images'] as List<dynamic>)
        .map((image) => image.toString())
        .toList();

    return Product(
      id: data['id'],
      category: data['category'],
      title: data['title'],
      description: data['description'],
      price: data['price'],
      texture: data['texture'],
      wash: data['wash'],
      place: data['place'],
      note: data['note'],
      story: data['story'],
      colors: colors,
      sizes: sizes,
      variants: variants,
      mainImage: data['main_image'],
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> colorsJson =
        colors.map((color) => color.toJson()).toList();
    final List variantsJson =
        variants.map((variant) => variant.toJson()).toList();
    final List<String> sizesJson =
        sizes.map((size) => size.toString()).toList();
    final List<String> imagesJson =
        images.map((image) => image.toString()).toList();

    return {
      'data': {
        'id': id,
        'category': category,
        'title': title,
        'description': description,
        'price': price,
        'texture': texture,
        'wash': wash,
        'place': place,
        'note': note,
        'story': story,
        'colors': colorsJson,
        'sizes': sizesJson,
        'variants': variantsJson,
        'main_image': mainImage,
        'images': imagesJson,
      },
    };
  }
}
