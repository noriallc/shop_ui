import 'package:flutter/material.dart';
import 'package:shop_ui/components/category_list_item.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/models/category_item.dart';
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
      body: _categoriesList(),
    );
  }

  Widget _categoriesList(){
    final args = ModalRoute.of(context)!.settings.arguments as RouteArguments;
    return Container(
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
            ...categoryItem.map((e) => CategoryListItem(
              title: e.title,
              rating: e.rating,
              infoText: e.infoText,
              image: e.image,
              onTap: () {
                go(context, RestaurantsMenuPage.routeName,
                    arguments: RouteArguments(
                        title: e.title, message: e.infoText));
              },
            )),
          ],
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
