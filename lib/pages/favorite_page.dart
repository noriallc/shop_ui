import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/components/favorite_items.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/models/favorite_item.dart';
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
        backgroundColor: AppTheme.primaryColor,
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
              ...favoriteItem.map((e) => FavoriteItemWidget(onTap: () {}, image: e.image, title: e.title, infoText: e.infoText, price: e.price)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 1, cartCount: 0),
    );
  }
}
