class CampaignItem {
  final int id;
  final int productId;
  final String picture;
  final String story;

  CampaignItem(
      {required this.id,
      required this.productId,
      required this.picture,
      required this.story});

  factory CampaignItem.fromJson(Map<String, dynamic> json) {
    return CampaignItem(
      id: json['id'],
      productId: json['product_id'],
      picture: json['picture'],
      story: json['story'],
    );
  }

  static List<CampaignItem> parseList(List<dynamic> list) {
    return list.map((item) => CampaignItem.fromJson(item)).toList();
  }
}

class CampaignResponse {
  final List<CampaignItem> data;

  CampaignResponse({required this.data});

  factory CampaignResponse.fromJson(Map<String, dynamic> json) {
    return CampaignResponse(
      data: CampaignItem.parseList(json['data']),
    );
  }
}
