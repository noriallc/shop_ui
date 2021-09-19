import 'dart:convert';

List<ListTile> listTileFromJson(String str) =>
    List<ListTile>.from(json.decode(str).map((x) => ListTile.fromJson(x)));

class ListTile {
  ListTile({
    required this.title,
  });

  String title;

  factory ListTile.fromJson(Map<String, dynamic> json) => ListTile(
        title: json["title"],
      );
}

final List<ListTile> listTile = listTileFromJson(''
    '[{"title": "My orders"},'
    '{"title": "My payment cards"},'
    '{"title": "My addresses"},'
    '{"title": "Promocodes"},'
    '{"title": "Share promocodes"},'
    '{"title": "FAQ"},'
    '{"title": "Exit" }]'
    '');
