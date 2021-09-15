import 'package:flutter/material.dart';
import 'package:shop_ui/components/categorys_widget.dart';
import 'package:shop_ui/components/product_slide_item.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/pages/user_profile_page.dart';
import 'package:shop_ui/widgets/bottom_app_bar.dart';
import 'package:shop_ui/widgets/app_widgets.dart';
import 'package:shop_ui/pages/shopping_cart_page.dart';
import 'package:shop_ui/pages/favorite_page.dart';
import '../route.dart';

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
      body: Container(
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
      ),
      bottomNavigationBar: BottomBar(currentIndex: 0, cartCount: 0),
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
                    color: Color(0xFF4FB453),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xFF46A74A),
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
              ProductSlideItem(
                discount: "-12%",
                title: 'Pizza Margherita',
                description: 'Made with San Marzano tomatoes',
                price: '15 USD',
                stars: 1.5,
                image:
                    'https://i.imgur.com/37lZ1VO.jpg',
              ),
              ProductSlideItem(
                title: 'Sushi',
                description: 'Sushi philadelphia ',
                price: '8 USD',
                stars: 5.0,
                image:
                    'https://i.imgur.com/pEaCNxO.jpg',
              ),
              ProductSlideItem(
                discount: "-25%",
                title: 'Cezar Salad',
                description: 'Add on Aged Cheddar Cheese ',
                price: '22 USD',
                stars: 2.4,
                image:
                'https://i.imgur.com/Hvek7Qe.jpg',

              ),
              ProductSlideItem(
                title: 'Salmon Tartar',
                description: 'Salmon Tartar skinless salmon',
                price: '12 USD',
                stars: 3.2,
                image:
                'https://i.imgur.com/sdI9ati.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
