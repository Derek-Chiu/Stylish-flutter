import 'package:flutter/material.dart';
import 'package:stylish/model/Product.dart';
import ' DetailScreen.dart';
import 'package:dio/dio.dart';

import 'model/ProductListResponse.dart';

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
    return _CategoryListViewState();
  }
}

class _CategoryListViewState extends State<CategoryListView> {
  List<String> categories = ['women', 'men', 'accessories'];
  List<ProductListResponse> products = [];

  @override
  void initState() {
    super.initState();
    print('initState');
    fetchList();
  }

  Future<void> fetchList() async {
    try {
      for (var category in categories) {
        print('fetchList: $category');
        await Dio()
            .get('https://api.appworks-school.tw/api/1.0/products/$category')
            .then((value) {
          ProductListResponse response =
              ProductListResponse.fromJson(value.data as Map<String, dynamic>);
          setState(() {
            print('setState');
            products.add(response);
            print('${products.length}');
          });
        });
      }
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    // return Text('${products.length}');
    if (MediaQuery.of(context).size.width >= 600) {
      return RowLayout(products: products);
    } else {
      return ColumnLayout(products: products);
    }
    // return FutureBuilder(
    //   future: Dio()
    //       .get('https://api.appworks-school.tw/api/1.0/products/$_category'),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       ProductListResponse response = ProductListResponse.fromJson(
    //           snapshot.data?.data as Map<String, dynamic>);
    //       return ListView.builder(
    //       itemCount: response.data.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           title: Text(response.data[index].title),
    //         );
    //       },
    //       );
    //     } else {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );
  }
}

class ColumnLayout extends StatelessWidget {
  List<ProductListResponse> products = [];

  ColumnLayout({
    super.key,
    required this.products,
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
            children: [
              // for (var element in pruducts) const SizedBox(width: 12),
              for (var element in products) CategoryList(categoryData: element),
            ],
          ),
        ),
      ],
    );
  }
}

class RowLayout extends StatelessWidget {
  List<ProductListResponse> products = [];

  RowLayout({super.key, required this.products});

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
            children: [
              // for (var element in pruducts) const SizedBox(width: 12),
              for (var element in products) CategoryList(categoryData: element),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryList extends StatelessWidget {
  ProductListResponse categoryData;

  CategoryList({
    super.key,
    required this.categoryData,
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
              itemCount: categoryData.data.length,
              itemBuilder: (context, index) =>
                  CategoryItem(product: categoryData.data[index]),
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
  Product product;

  CategoryItem({
    Key? key,
    required this.product,
  }) : super(key: key);

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
          Image(
            image: NetworkImage(product.mainImage),
            fit: BoxFit.fitHeight,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(product.title!),
              Text('NT\$ ${product.price}'),
            ],
          ),
        ]),
      ),
    );
  }
}
