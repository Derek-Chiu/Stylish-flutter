import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STYLiSH'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          ProductInfo(),
          SizedBox(height: 12),
          ProductGalleryItem(),
          ProductGalleryItem(),
          ProductGalleryItem(),
          ProductGalleryItem(),
          ProductGalleryItem(),
          ProductGalleryItem(),
          ProductGalleryItem(),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).size.width >= 600) {
    //   return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //     const ProductGalleryItem(),
    // Column(
    //   children: const [
    //     Text('UNIQLO Light-Weight Dwon Jacket'),
    //     Text('21332102'),
    //     Text('NT\$ 1,990'),
    //     Text('color'),
    //     Text('size'),
    //     Text('stock'),
    //     Text('note'),
    //     Text('description'),
    //     Text('story'),
    //   ],
    // )
    //   ]);
    // } else {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ProductGalleryItem(),
          Text('UNIQLO Light-Weight Dwon Jacket'),
          Text('21332102'),
          Text('NT\$ 1,990'),
          Text('color'),
          Text('size'),
          Text('stock'),
          Text('note'),
          Text('description'),
          Text('story')
        ]);
  }
  // }
}

class PeoductGallery extends StatelessWidget {
  const PeoductGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        ProductGalleryItem(),
        SizedBox(height: 12),
        ProductGalleryItem(),
        SizedBox(height: 12),
        ProductGalleryItem(),
        SizedBox(height: 12),
      ],
    );
  }
}

class ProductGalleryItem extends StatelessWidget {
  const ProductGalleryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 16 / 9,
      child: Image(
        image: NetworkImage(
            'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
      ),
    );
  }
}
