import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/widgets/bottom_app_bar.dart';
import 'package:shop_ui/widgets/app_widgets.dart';
import 'package:shop_ui/components/list_items.dart';

class ShoppingCartWidget extends StatefulWidget {
  static const routeName = '/shopping_cart';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShoppingCartWidgetState();
  }
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  int cartCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        iconTheme: IconThemeData(
          color: AppTheme.primaryBlack, //change your color here
        ),
        elevation: 0,
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            color: AppTheme.primaryBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
            child: _cartList(20),
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _priceInfo() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Delivery",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Free",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "20 USD",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Container(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: AppButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Make Order',
            options: AppButtonOptions(
              width: double.infinity,
              height: 50,
              color: AppTheme.primaryColor,
              textStyle: AppTheme.subtitle2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 20,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: AppButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Continue Shopping',
            options: AppButtonOptions(
              width: double.infinity,
              height: 50,
              color: Color(0xFFD1D4D6),
              textStyle: AppTheme.subtitle2.override(
                fontFamily: 'Poppins',
                color: AppTheme.primaryColor,
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 20,
            ),
          ),
        )
      ]),
    );
  }

  Widget _cartList(int count){
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          for (int i = 0; i < count; i++)
            Padding(
              padding:
              EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
              child: CartItemWidget(
                onTap: () {},
                topRadius: ((i == 0) ? 10 : 0),
                bottomRadius: ((i == count-1) ? 10 : 0),
                title: 'Sushi',
                infoText: 'Dragon garden',
                price: '10 USD',
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: _priceInfo(),
          ),
          Container(
            child: _buttons(),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0, 1),
              child: BottomBar(currentIndex: 2, cartCount: 0),
            ),
          ),
        ],
      ),
    );
  }
}
