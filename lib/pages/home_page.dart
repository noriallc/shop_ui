import 'package:flutter/material.dart';
import 'package:shop_ui/components/categorys_widget.dart';
import 'package:shop_ui/components/product_slide_item.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/models/product_slide_item.dart';
import 'package:shop_ui/widgets/bottom_app_bar.dart';
import 'package:shop_ui/widgets/app_widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  int cartCount = 2;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _menuButton(),
        title: _searchBar(),
      ),
      body: _categories(topPadding),
      bottomNavigationBar: BottomBar(currentIndex: 0, cartCount: 0),
    );
  }

  Widget _categories(double topPadding){
    return  Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            topPadding.height,
            Container(
              padding: EdgeInsets.only(
                left: 0,
                right: 0,
                top: 15,
                bottom: 15,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    5.width,
                    CategoriesWidget(
                      icon: Icons.restaurant,
                      text: 'Restaurants',
                    ),
                    CategoriesWidget(
                      icon: Icons.coffee,
                      text: 'Coffee Shops',
                    ),
                    CategoriesWidget(
                      icon: Icons.shopping_basket,
                      text: 'Supermarkets',
                    ),
                    5.width,
                  ],
                ),
              ),
            ),
            _scrollItems(title: 'Special Offers'),
            _scrollItems(title: 'Popular Food'),
            _scrollItems(title: 'For You'),
          ],
        ),
      ),
    );
  }

  Widget _menuButton() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: IconButton(
        onPressed: () {
          print('IconButton pressed ...');
        },
        icon: Icon(
          Icons.menu,
          color: Color(0xFF363a39),
          size: 30,
        ),
        iconSize: 30,
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

  Widget _scrollItems({required String title}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF252724),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'View All',
                options: AppButtonOptions(
                  width: 80,
                  height: 30,
                  color: Color(0xFFFAFAFB),
                  textStyle: AppTheme.subtitle2.override(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: AppTheme.primaryColor,
                  ),
                  borderSide: BorderSide(
                    color: AppTheme.primaryColor,
                    width: 1,
                  ),
                  borderRadius: 40,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ...productItem.map((e) => ProductSlideItem(
                    discount: e.discount == "0%" ? "" : e.discount,
                    title: e.title,
                    description: e.description,
                    price: e.price,
                    stars: e.stars,
                    image: e.image,
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
