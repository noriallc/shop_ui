import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/components/favorite_items.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/widgets/bottom_app_bar.dart';

class FavoritePageWidget extends StatefulWidget {
  static const routeName = '/favorite_page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createStateFa
    return _FavoritePageWidgetState();
  }
}

class _FavoritePageWidgetState extends State<FavoritePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  int cartCount = 2;
  late RouteArguments _args;

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context)!.settings.arguments as RouteArguments;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF4DAC51),
        automaticallyImplyLeading: true,
        title: Text(
          _args.title ?? 'Favorite Items',
          style: AppTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: AppTheme.tertiaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('IconButton pressed ...');
            },
            icon: Icon(
              Icons.search,
              color: AppTheme.tertiaryColor,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: FavoriteItemWidget(
                    onTap: () {},
                    image: 'https://i.imgur.com/gE1umz8.png',
                    title: 'Pizza Margherita',
                    infoText: 'Made with San Marzano tomatoes',
                    price: '25 USD'),
              ),
              FavoriteItemWidget(
                  onTap: () {},
                  title: 'Salmon Tartar',
                  image: 'https://i.imgur.com/sdI9ati.jpg',
                  infoText:  'Salmon Tartar skinless salmon',
                  price: '50 USD'),
              FavoriteItemWidget(
                  onTap: () {},
                  image: 'https://i.imgur.com/Nen335I.jpg',
                  title: 'Pizza Peperoni',
                  infoText: 'Pizza with peperoni',
                  price: '18 USD'),
              FavoriteItemWidget(
                  onTap: () {},
                  image: 'https://i.imgur.com/Hvek7Qe.jpg',
                  title: 'Salad',
                  infoText: 'Salad with vegetables',
                  price: '26 USD'),
              FavoriteItemWidget(
                  onTap: () {},
                  image: 'https://i.imgur.com/pEaCNxO.jpg',
                  title: 'Sushi',
                  infoText: 'Sushi philadelphia with salmon',
                  price: '25 USD'),
              FavoriteItemWidget(
                  onTap: () {},
                  image: 'https://i.imgur.com/Z9iqCEu.jpg',
                  title: 'Sile',
                  infoText: 'Sile with vegetables',
                  price: '26 USD'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 1, cartCount: 0),
    );
  }
}
