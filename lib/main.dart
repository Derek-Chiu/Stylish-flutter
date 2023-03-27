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
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
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
            Row(
              children: [
                Column(children: [
                  Container(
                    height: 800,
                    child: ListView(
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
                ]),
                // Column(children: const [
                //   Text("Column 2 fuck you"),
                //   Text("Column 2 fuck you"),
                //   Text("Column 2 fuck you"),
                //   Text("Column 2 fuck you"),
                //   Text("Column 2 fuck you"),
                // ]),
                // Column(
                //   children: const [
                //     Text("Column 3 fuck you"),
                //     Text("Column 3 fuck you"),
                //     Text("Column 3 fuck you"),
                //     Text("Column 3 fuck you"),
                //     Text("Column 3 fuck you"),
                //   ],
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
