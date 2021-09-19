import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/widgets/app_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteItemWidget extends StatelessWidget {
  FavoriteItemWidget({
    this.height = 150,
    this.radius = 12.0,
    required this.image,
    this.title = '',
    this.infoText = '',
    this.price = '',
    required this.onTap,
  });

  final String title;
  final String price;
  final String infoText;
  final double radius;
  final double height;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _image(),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _title(),
                    _infoText(),
                    _price(),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _counter(),
                          _addToCart(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _infoText() {
    return Padding(
      padding: EdgeInsets.only(top: 1, bottom: 1),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            infoText,
            style: AppTheme.bodyText1.override(
              color: Color(0xFF8B97A2),
              fontFamily: 'Lexend Deca',
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: EdgeInsets.only(top: 1, bottom: 1),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: AppTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: AppTheme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _price() {
    return Padding(
      padding: EdgeInsets.only(top: 1, bottom: 1),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            price,
            textAlign: TextAlign.start,
            style: AppTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: AppTheme.darkBGColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _counter() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment(0, 0),
              child: FaIcon(
                FontAwesomeIcons.minus,
                color: AppTheme.primaryColor,
                size: 14,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5, top: 5),
          child: Text(
            '1',
            style: AppTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: Color(0xFF789A8C),
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment(0, 0),
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: AppTheme.primaryColor,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addToCart() {
    return Expanded(
      child: Align(
        alignment: AlignmentDirectional(1, 0),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: AppButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Add to cart',
            options: AppButtonOptions(
              width: 120,
              height: 30,
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
        ),
      ),
    );
  }
}
