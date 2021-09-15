import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/pages/product_item.dart';
import 'package:shop_ui/route.dart';
import 'package:shop_ui/widgets/app_widgets.dart';

class ProductSlideItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String discount;
  final String price;
  final double? stars;

  ProductSlideItem({
    required this.image,
    required this.title,
    this.description = '',
    this.discount = '',
    this.price = '',
    this.stars,
  });

  final double radius = 12.0;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimationWidget(
      onTap: () {
        go(context, ProductItem.routeName, arguments: RouteArguments(image: image, title: title, message: description));
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Material(
          color: Colors.transparent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Stack(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: Image.network(
                      image,
                      width: 130,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(210, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  alignment: Alignment(0, 0),
                ),
                (discount == '' ? Divider() : _discount()),
                _nameDescription(),
                _bottomStar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _discount() {
    return Positioned(
      right: 0,
      top: 20,
      child: Container(
        padding: EdgeInsets.only(left: 13.0, right: 13, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            )),
        child: Text(
          discount,
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _nameDescription() {
    return Positioned(
      top: description == '' ? 90 : 60,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: AppTheme.title3.override(
                fontFamily: 'Poppins',
                color: AppTheme.tertiaryColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            (description == ''
                ? Divider()
                : Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      description,
                      textAlign: TextAlign.start,
                      style: AppTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: AppTheme.tertiaryColor,
                        fontSize: 9,
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }

  Widget _bottomStar() {
    return Positioned(
      bottom: -5,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 10.0, bottom: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                price,
                textAlign: TextAlign.start,
                style: AppTheme.title3.override(
                  fontFamily: 'Poppins',
                  color: AppTheme.tertiaryColor,
                  fontSize: 13,
                ),
              ),
            ),
            (stars != null
                ? Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: AppTheme.tertiaryColor,
                        size: 10,
                      ),
                      Text(
                        stars.toString(),
                        textAlign: TextAlign.start,
                        style: AppTheme.title3.override(
                          fontFamily: 'Poppins',
                          color: AppTheme.tertiaryColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                : Divider()),
          ],
        ),
      ),
    );
  }
}
