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
          DetailGalleryItem(),
          SizedBox(height: 12),
          DetailGalleryItem(),
          SizedBox(height: 12),
          DetailGalleryItem(),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}

class DetailInfoItem extends StatelessWidget {
  const DetailInfoItem({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class DetailGalleryItem extends StatelessWidget {
  const DetailGalleryItem({super.key});

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
