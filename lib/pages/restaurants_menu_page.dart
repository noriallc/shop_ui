import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_ui/components/category_list_item.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/pages/categories_page.dart';
import 'package:shop_ui/pages/favorite_page.dart';
import 'package:shop_ui/widgets/app_widgets.dart';
import 'package:shop_ui/widgets/bottom_app_bar.dart';

import '../route.dart';

class RestaurantsMenuPage extends StatefulWidget {
  RestaurantsMenuPage({Key? key}) : super(key: key);

  static const routeName = '/restaurants_menu';

  @override
  _RestaurantsMenuPageState createState() => _RestaurantsMenuPageState();
}

class _RestaurantsMenuPageState extends State<RestaurantsMenuPage> {
  int currentIndex = 0;
  int cartCount = 2;
  late RouteArguments _args;

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context)!.settings.arguments as RouteArguments;
    return Scaffold(
      bottomNavigationBar: BottomBar(currentIndex: 0, cartCount: 0),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _bar(),
              Container(
                padding: EdgeInsets.only(
                  top: 15,
                ),
                alignment: Alignment.center,
              ),
              CategoryListItem(
                title: 'Salads',
                centerTitle: true,
                image:
                    'https://i.imgur.com/Hvek7Qe.jpg',
                onTap: () {},
              ),
              CategoryListItem(
                title: 'Fish',
                centerTitle: true,
                image:
                    'https://i.imgur.com/tDFB2xg.jpg',
                onTap: () {},
              ),
              CategoryListItem(
                title: 'Sides',
                centerTitle: true,
                image:
                    'https://i.imgur.com/Z9iqCEu.jpg',
                onTap: () {},
              ),
              CategoryListItem(
                title: 'Pizzas',
                centerTitle: true,
                image:
                    'https://i.imgur.com/8kXkJ6A.jpg',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bar() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppButtonWidget(
                  onPressed: () {
                    go(context, CategoriesPage.routeName,
                        arguments: RouteArguments(title: "Restaurants"));
                  },
                  text: '',
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppTheme.tertiaryColor,
                    size: 20,
                  ),
                  options: AppButtonOptions(
                    width: 50,
                    height: 40,
                    color: AppTheme.primaryColor,
                    textStyle: AppTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
                Text(
                  _args.title ?? 'CITRONELLE',
                  textAlign: TextAlign.center,
                  style: AppTheme.title1.override(
                    fontFamily: 'Poppins',
                    color: AppTheme.tertiaryColor,
                  ),
                ),
                AppButtonWidget(
                  onPressed: () {},
                  text: '',
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppTheme.tertiaryColor,
                  ),
                  options: AppButtonOptions(
                    width: 50,
                    height: 40,
                    color: AppTheme.primaryColor,
                    textStyle: AppTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Container(
                    width: 300,
                    height: 25,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.brightness_1_rounded,
                        //   color: AppTheme.tertiaryColor,
                        //   size: 8,
                        // ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            _args.message ?? 'Armenia    40-60 member    10-15 USD',
                            style: AppTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: AppTheme.tertiaryColor,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
