import 'dart:convert';

List<ProductItem> productItemFromJson(String str) => List<ProductItem>.from(
    json.decode(str).map((x) => ProductItem.fromJson(x)));

class ProductItem {
  ProductItem({
    required this.discount,
    required this.title,
    required this.description,
    required this.price,
    required this.stars,
    required this.image,
  });

  String discount;
  String title;
  String description;
  String price;
  String stars;
  String image;

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
    discount: json["discount"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    stars: json["stars"],
    image: json["image"],
  );
}

final List<ProductItem> productItem = productItemFromJson(''
    '[{"title": "Pizza Margherita", "discount": "-12%", "description": "Made with San Marzano tomatoes", "price": "15 USD", "stars": "1.5", "image": "https://i.imgur.com/37lZ1VO.jpg"},'
    '{"title": "Sushi", "discount": "0%", "description": "Sushi philadelphia ", "price": "8 USD", "stars": "5.0", "image": "https://i.imgur.com/pEaCNxO.jpg"},'
    '{"title": "Cezar Salad", "discount": "-25%", "description": "Add on Aged Cheddar Cheese ", "price": "22 USD", "stars": "2.4", "image": "https://i.imgur.com/Hvek7Qe.jpg"},'
    '{"title": "Salmon Tartar", "discount": "0%", "description": "Salmon Tartar skinless salmon", "price": "12 USD", "stars": "3.2", "image": "https://i.imgur.com/sdI9ati.jpg"}]'
    '');