import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stylish/model/Product.dart';
import 'package:stylish/model/campaign_response.dart';
import 'DetailScreen.dart';
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

  @override
  State<StatefulWidget> createState() {
    return _CategoryListViewState();
  }
}

class BatteryLevelView extends StatefulWidget {
  const BatteryLevelView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BatteryLevelViewState();
  }
}

class _BatteryLevelViewState extends State<BatteryLevelView> {
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/battery');
  // static const EventChannel eventChannel =
  //     EventChannel('samples.flutter.io/charging');

  String _batteryLevel = 'Battery level: unknown.';
  // String _chargingStatus = 'Battery status: unknown.';

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
    // eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int? result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException catch (e) {
      if (e.code == 'NO_BATTERY') {
        batteryLevel = 'No battery.';
      } else {
        batteryLevel = 'Failed to get battery level.';
      }
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  // void _onEvent(Object? event) {
  //   setState(() {
  //     _chargingStatus =
  //         "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
  //   });
  // }

  // void _onError(Object error) {
  //   setState(() {
  //     _chargingStatus = 'Battery status: unknown.';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Text(_batteryLevel, key: const Key('Battery level label'));
  }
}

class TapPayMessageView extends StatefulWidget {
  const TapPayMessageView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TapPayMessageState();
  }
}

class _TapPayMessageState extends State<TapPayMessageView> {
  static const platform = MethodChannel('test_tappay');
  String _tappayMessage = 'TapPay Message: unknown.';

  @override
  void initState() {
    super.initState();
    _inputCreditCard();
  }

  Future<void> _inputCreditCard() async {
    String message;

    try {
      final String result = await platform.invokeMethod('tappay');
      message = result;
    } on PlatformException catch (e) {
      message = e.message ?? '';
    }

    setState(() {
      _tappayMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('TapPay Message: $_tappayMessage');
  }
}

class _CategoryListViewState extends State<CategoryListView> {
  List<String> categories = ['women', 'men', 'accessories'];
  List<ProductListResponse> products = [];

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  Future<void> fetchList() async {
    try {
      for (var category in categories) {
        await Dio()
            .get('https://api.appworks-school.tw/api/1.0/products/$category')
            .then((value) {
          ProductListResponse response =
              ProductListResponse.fromJson(value.data as Map<String, dynamic>);
          products.add(response);
        });
      }
    } catch (e) {
      print('error: $e');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 600) {
      return RowLayout(products: products);
    } else {
      return ColumnLayout(products: products);
    }
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
        const BannerListView(),
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
        const BannerListView(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var element in products) CategoryList(categoryData: element),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryList extends StatelessWidget {
  final Map<String, String> categoryMap = {
    'women': '女裝',
    'men': '男裝',
    'accessories': '配件'
  };
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
          Text(categoryMap[categoryData.data[0].category] ?? 'Hello',
              style: const TextStyle(fontSize: 20, height: 3)),
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

class BannerListView extends StatefulWidget {
  const BannerListView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BannerListState();
  }
}

class _BannerListState extends State<BannerListView> {
  CampaignResponse campaignResponse = CampaignResponse(data: []);

  @override
  void initState() {
    super.initState();
    fetchBannerList();
  }

  Future<void> fetchBannerList() async {
    try {
      await Dio()
          .get('https://api.appworks-school.tw/api/1.0/marketing/campaigns')
          .then((value) {
        setState(() {
          campaignResponse =
              CampaignResponse.fromJson(value.data as Map<String, dynamic>);
        });
      });
    } catch (e) {
      print('fetch banner error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const BatteryLevelView(),
        const SizedBox(height: 10),
        const TapPayMessageView(),
        const SizedBox(height: 30),
        SizedBox(
          height: 300,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: campaignResponse.data.length,
            itemBuilder: (context, index) =>
                BannerItem(item: campaignResponse.data[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        )
      ],
    );
  }
}

class BannerItem extends StatelessWidget {
  CampaignItem item;

  BannerItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image(
        image: NetworkImage(item.picture),
        fit: BoxFit.fitWidth,
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
              Text(product.title),
              Text('NT\$ ${product.price}'),
            ],
          ),
        ]),
      ),
    );
  }
}
