import 'package:flutter/material.dart';
import 'package:shop_ui/components/category_list_item.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/pages/restaurants_menu_page.dart';
import 'package:shop_ui/widgets/bottom_app_bar.dart';
import 'package:shop_ui/widgets/app_widgets.dart';
import '../route.dart';

class CategoriesPage extends StatefulWidget {
  static const routeName = '/categories';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoriesPageState();
  }
}

class CategoriesPageState extends State<CategoriesPage> {
  int currentIndex = 0;
  int cartCount = 2;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RouteArguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: AppTheme.primaryBlack, //change your color here
        ),
        elevation: 0,
        title: _searchBar(),
      ),
      bottomNavigationBar: BottomBar(currentIndex: 0, cartCount: 0),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                ),
                alignment: Alignment.center,
                child: Text(
                  args.title.toString(),
                  style: AppTheme.title1,
                ),
              ),
              CategoryListItem(
                title: 'CINTRONELLE',
                rating: "4.2",
                infoText: 'French cuisine   40-50 member    15-20 USD',
                image: 'https://i.imgur.com/Nd4cs3a.jpg',
                onTap: () {
                  go(context, RestaurantsMenuPage.routeName,
                      arguments: RouteArguments(
                          title: 'CINTRONELLE',
                          message:
                              'French cuisine   40-50 member    15-20 USD'));
                },
              ),
              CategoryListItem(
                rating: "4.2",
                title: 'VERO VERO',
                infoText: 'Italian cuisine    40-60 member    10-15 USD',
                image: 'https://i.imgur.com/3ZsaaZj.jpg',
                onTap: () {
                  go(context, RestaurantsMenuPage.routeName,
                      arguments: RouteArguments(
                          title: 'VERO VERO',
                          message: 'Armenia    40-60 member    10-15 USD'));
                },
              ),
              CategoryListItem(
                title: 'MILK BAR',
                rating: "4.9",
                infoText: 'European cuisine    40-60 member    10-25 USD',
                image: 'https://i.imgur.com/HCZDeIw.jpg',
                onTap: () {
                  go(context, RestaurantsMenuPage.routeName,
                      arguments: RouteArguments(
                          title:  'MILK BAR',
                          message: 'European cuisine    40-60 member    10-25 USD'));
                },
              ),
              CategoryListItem(
                title: 'DVIN MUSIC HALL',
                rating: "5.0",
                infoText: 'Armenia    40-50 member    10-15 USD',
                image: 'https://i.imgur.com/tlvSazi.jpg',
                onTap: () {
                  go(context, RestaurantsMenuPage.routeName,
                      arguments: RouteArguments(
                          title: 'DVIN MUSIC HALL',
                          message: 'Armenia    40-50 member    10-15 USD'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 35,
              padding: EdgeInsets.only(left: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "What are you looking for?",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(0xffafafaf),
                  ),
                  filled: true,
                  fillColor: Color(0x88DEDEDE),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 72, 0),
                ),
              ),
            ),
          ),
          Positioned(
            right: 3,
            top: 2,
            child: Container(
              padding: EdgeInsets.only(top: 1),
              child: AppButtonWidget(
                onPressed: () {},
                options: AppButtonOptions(
                    width: 60,
                    height: 29,
                    borderRadius: 20,
                    color: AppTheme.primaryColor),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 23,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
