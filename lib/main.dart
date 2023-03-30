import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => const BannerCard(),
                separatorBuilder: (context, index) => const SizedBox(width: 12),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Hello'),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 13,
                            itemBuilder: (context, index) => const ItemCard(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) => const ItemCard(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) => const ItemCard(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Column(
          children: const [
            Text('Hello'),
            Image(
              image: NetworkImage(
                  'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Row(
          children: [
            const AspectRatio(
              aspectRatio: 16 / 9,
              child: Image(
                image: NetworkImage(
                    'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              children: const [
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
