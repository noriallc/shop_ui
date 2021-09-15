import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';


class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    this.height = 150,
    this.radius = 12.0,
    this.topRadius = 0.0,
    this.bottomRadius = 0.0,
    this.title = '',
    required this.onTap,
  });

  final String title;
  final double radius;
  final double topRadius;
  final double bottomRadius;
  final double height;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, top: 0, bottom: 1),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topRadius),
            topRight: Radius.circular(topRadius),
            bottomLeft: Radius.circular(bottomRadius),
            bottomRight: Radius.circular(bottomRadius),
          ),
        ),
        child: ListTile(
          title: Text(
            title,
            style: AppTheme.title3.override(
              fontFamily: 'Poppins',
              fontSize: 15,
            ),

          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF303030),
            size: 20,
          ),
          tileColor: Color(0xFFF5F5F5),
          dense: false,
        ),
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 2.5,
          bottom: 2.5,
        ),

      ),
    );
  }
}
