import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/widgets/app_widgets.dart';

class CategoryListItem extends StatelessWidget {
  CategoryListItem({
    this.height = 150,
    this.radius = 12.0,
    required this.image,
    this.rating,
    this.centerTitle = false,
    this.title = '',
    this.infoText = '',
    required this.onTap,
  });

  final String title;
  final String infoText;
  final bool centerTitle;
  final double radius;
  final double height;
  final String image;
  final String? rating;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return ScaleAnimationWidget(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: _width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Image.network(
                    image,
                    width: _width,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ),
                AppTheme.imageOverlay(),
                (rating == null ? Divider() : _rating()),
                _title(),
                (centerTitle ? Divider() : _info()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rating() {
    return Positioned(
      top: 15,
      child: Container(
        padding: EdgeInsets.only(left: 13.0, right: 13, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )),
        child: Row(
          children: [
            Icon(
              Icons.star_outlined,
              size: 12,
              color: AppTheme.white,
            ),
            2.width,
            Text(
              rating.toString(),
              style: TextStyle(
                color: AppTheme.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Positioned(
      top: height / 2 + (centerTitle ? -14 : 10),
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: AppTheme.title3.override(
            fontFamily: 'Poppins',
            color: AppTheme.tertiaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _info() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          infoText,
          textAlign: TextAlign.start,
          style: AppTheme.title3.override(
            fontFamily: 'Poppins',
            color: AppTheme.tertiaryColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
