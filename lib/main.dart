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
                itemBuilder: (context, index) => const ItemCard(),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: const [
                        Image(
                          image: NetworkImage(
                              'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                          fit: BoxFit.fitWidth,
                          width: 200,
                        ),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            fit: BoxFit.fitWidth,
                            width: 200),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            fit: BoxFit.fitWidth,
                            width: 200),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            fit: BoxFit.fitWidth,
                            width: 200),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            fit: BoxFit.fitWidth,
                            width: 200),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: const [
                        Image(
                          image: NetworkImage(
                              'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                        ),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: const [
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                        Image(
                            image: NetworkImage(
                                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
                            width: 200,
                            height: 100),
                      ],
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

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

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
