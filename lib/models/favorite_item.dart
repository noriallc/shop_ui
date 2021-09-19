import 'dart:convert';

List<FavoriteItem> favoriteItemFromJson(String str) => List<FavoriteItem>.from(json.decode(str).map((x) => FavoriteItem.fromJson(x)));

class FavoriteItem {
  FavoriteItem({
    required this.image,
    required this.title,
    required this.infoText,
    required this.price,
  });

  String image;
  String title;
  String infoText;
  String price;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) => FavoriteItem(
        image: json["image"],
        title: json["title"],
        infoText: json["infoText"],
        price: json["price"],
      );
}

final List<FavoriteItem> favoriteItem = favoriteItemFromJson(''
    '[{"image": "https://i.imgur.com/gE1umz8.png", "title": "Pizza Margherita", "infoText": "Made with San Marzano tomatoes", "price": "25 USD"},'
    '{"image": "https://i.imgur.com/sdI9ati.jpg", "title": "Salmon Tartar", "infoText": "Salmon Tartar skinless salmon", "price": "50 USD"},'
    '{"image": "https://i.imgur.com/Nen335I.jpg", "title": "Pizza Peperoni", "infoText": "Pizza with peperoni", "price": "18 USD"},'
    '{"image": "https://i.imgur.com/Hvek7Qe.jpg", "title": "Salad", "infoText": "Salad with vegetables", "price": "26 USD"},'
    '{"image": "https://i.imgur.com/pEaCNxO.jpg", "title": "Sushi", "infoText": "Sushi philadelphia with salmon", "price": "25 USD"},'
    '{"image": "https://i.imgur.com/Z9iqCEu.jpg", "title": "Sile", "infoText": "Sile with vegetables", "price": "26 USD"}]'
    '');
