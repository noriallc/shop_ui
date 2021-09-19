import 'dart:convert';

List<RestaurantsMenuPage> restaurantsMenuPageFromJson(String str) => List<RestaurantsMenuPage>.from(json.decode(str).map((x) => RestaurantsMenuPage.fromJson(x)));

class RestaurantsMenuPage {
  RestaurantsMenuPage({
    required this.image,
    required this.title,
  });

  String image;
  String title;

  factory RestaurantsMenuPage.fromJson(Map<String, dynamic> json) => RestaurantsMenuPage(
    image: json["image"],
    title: json["title"],
  );
}
final List<RestaurantsMenuPage> restaurantsMenuPage = restaurantsMenuPageFromJson(''
    '[{"image": "https://i.imgur.com/Hvek7Qe.jpg", "title": "Salads"},'
    '{"image": "https://i.imgur.com/tDFB2xg.jpg", "title": "Fish"},'
    '{"image": "https://i.imgur.com/Z9iqCEu.jpg", "title": "Sides"},'
    '{"image": "https://i.imgur.com/8kXkJ6A.jpg", "title": "Pizzas"}]'
    '');
