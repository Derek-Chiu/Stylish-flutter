import 'package:flutter/material.dart';
import ' DetailScreen.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('STYLiSH'),
        ),
        body: const CategoryListView(),
      ),
    );
  }
}

// class CategoryListView extends StatelessWidget {
class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   if (MediaQuery.of(context).size.width >= 600) {
  //     return const RowLayout();
  //   } else {
  //     return const ColumnLayout();
  //   }
  // }

  @override
  State<StatefulWidget> createState() {
    return CategoryListViewState();
  }
}

class CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Dio().get('https://api.appworks-school.tw/api/1.0/products/women'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            // itemCount: snapshot.data?.length,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ListTile(
                // title: Text(snapshot.data[index]?.title),
                title: Text('dsafsdfasd'),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class ColumnLayout extends StatelessWidget {
  const ColumnLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
          height: 150,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => const BannerItem(),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(width: 12),
              CategoryList(),
              SizedBox(width: 12),
              CategoryList(),
              SizedBox(width: 12),
              CategoryList(),
              SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class RowLayout extends StatelessWidget {
  const RowLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
          height: 150,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => const BannerItem(),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(width: 12),
              CategoryList(),
              SizedBox(width: 12),
              CategoryList(),
              SizedBox(width: 12),
              CategoryList(),
              SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text('Hello', style: TextStyle(fontSize: 20, height: 3)),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 13,
              itemBuilder: (context, index) => const CategoryItem(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: const AspectRatio(
        aspectRatio: 16 / 9,
        child: Image(
          image: NetworkImage(
              'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailScreen(),
          ),
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        child: Row(children: [
          const Image(
            image: NetworkImage(
                'https://miro.medium.com/v2/resize:fit:1400/format:webp/0*6rbe1FVWIoZGgZdH.jpg'),
            fit: BoxFit.fitHeight,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('UNIQLO 特級輕量羽絨外套'),
              Text('NT\$ 1,299'),
            ],
          ),
        ]),
      ),
    );
  }
}
