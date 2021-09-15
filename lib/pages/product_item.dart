import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/widgets/bottom_app_bar.dart';
import 'package:shop_ui/widgets/app_widgets.dart';


class ProductItem extends StatefulWidget {
  static const routeName = '/product-item';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductItemState();
  }
}

class ProductItemState extends State<ProductItem> {
  int _count = 0;
  late RouteArguments _args;
  int currentIndex = 0;
  int cartCount = 2;

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context)!.settings.arguments as RouteArguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        iconTheme: IconThemeData(
          color: AppTheme.primaryBlack, //change your color here
        ),
        elevation: 0,
        title: Text(
          _args.title ?? 'Salad',
          style: TextStyle(
            color: AppTheme.primaryBlack,
          ),
        ),
      ),
      body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _image(),
                _description(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _info(),
                      _rating(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _counter(),
                      _price(),
                    ],
                  ),
                ),
                _addToCart(),
              ],
            ),
        ),
      bottomNavigationBar: BottomBar(currentIndex: 0, cartCount: 0),
    );
  }

  Widget _image() {
    return Container(
      alignment: Alignment(0, 0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            _args.image ??
                'https://media-cdn.tripadvisor.com/media/photo-s/0d/60/d5/36/susi-box.jpg',
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        _args.message ??
        'Mix salad with egg, bread crunches, tomatoes, cheese, mustard and lemon source',
        style: AppTheme.bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _info() {
    return Container(
      child: Text(
        '250g | 125 cal',
        style: AppTheme.bodyText1.override(
          fontFamily: 'Poppins',
          color: AppTheme.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _rating() {
    return Container(
      child: Row(
        children: [
          for (int i = 1; i <= 5; i++)
            Icon(
              Icons.star_outlined,
              color: AppTheme.primaryColor,
              size: 24,
            ),
          Text(
            '4.5',
            style: AppTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: AppTheme.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  Widget _counter() {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _count--;
              if (_count < 0) {
                _count = 0;
              }
              setState(() {});
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment(0, 0),
                child: FaIcon(
                  FontAwesomeIcons.minus,
                  color: AppTheme.primaryColor,
                  size: 8,
                ),
              ),
            ),
          ),
          Container(
            width: 25,
            //padding: EdgeInsets.only(left: 8, right: 8),
            alignment: Alignment.center,
            child: Text(
              _count.toString(),
              style: TextStyle(
                  color: AppTheme.primaryBlack,
                  fontWeight: FontWeight.w600),
            ),
          ),
          GestureDetector(
            onTap: () {
              _count++;
              if (_count > 40) {
                _count = 40;
              }
              setState(() {});
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment(0, 0),
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  color: AppTheme.primaryColor,
                  size: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _price() {
    return Container(
      child: Text(
        '15 USD',
        textAlign: TextAlign.end,
        style: AppTheme.bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _addToCart() {
    return Expanded(
      child: Align(
        alignment: Alignment(0, 0.95),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: AppButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Add to cart',
            options: AppButtonOptions(
              width: double.infinity,
              height: 50,
              color: AppTheme.primaryColor,
              textStyle: AppTheme.subtitle2.override(
                fontFamily: 'Poppins',
                color: AppTheme.white,
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
        ),
      ),
    );
  }

}
