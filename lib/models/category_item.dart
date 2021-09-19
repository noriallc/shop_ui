import 'dart:convert';

List<CategoryItem> categoryItemFromJson(String str) => List<CategoryItem>.from(json.decode(str).map((x) => CategoryItem.fromJson(x)));

class CategoryItem {
  CategoryItem({
    required this.image,
    required this.title,
    required this.infoText,
    required this.rating,
  });

  String image;
  String title;
  String infoText;
  String rating;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
    image: json["image"],
    title: json["title"],
    infoText: json["infoText"],
    rating: json["rating"],
  );
}

final List<CategoryItem> categoryItem = categoryItemFromJson(''
    '[{"image": "https://i.imgur.com/Nd4cs3a.jpg", "title": "CINTRONELLE", "infoText": "French cuisine   40-50 member    15-20 USD", "rating": "4.2"},'
    '{"image": "https://i.imgur.com/3ZsaaZj.jpg", "title": "VERO VERO", "infoText": "Italian cuisine    40-60 member    10-15 USD", "rating": "4.2"},'
    '{"image": "https://i.imgur.com/HCZDeIw.jpg", "title": "MILK BAR", "infoText": "European cuisine    40-60 member    10-25 USD", "rating": "4.9"},'
    '{"image": "https://i.imgur.com/tlvSazi.jpg", "title": "DVIN MUSIC HALL", "infoText": "Armenia    40-50 member    10-15 USD", "rating": "5.0"}]'
    '');
