import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/pages/categories_page.dart';
import 'package:shop_ui/route.dart';
import 'package:shop_ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  CategoriesWidget({
    required this.icon,
    required this.text,
  });

  final double radius = 12.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
      child: AppButtonWidget(
        onPressed: () {
          go(context, CategoriesPage.routeName, arguments: RouteArguments(title: text));
        },
        text: text,
        icon: Icon(
          icon,
          color: Color(0xFF85a390),
          size: 20,
        ),
        options: AppButtonOptions(
          elevation: 2,
          width: 160,
          height: 60,
          color: Color(0xFFCFF0DD),
          textStyle: AppTheme.subtitle2.override(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Color(0xFF85a390),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: radius,
        ),
      ),
    );
  }
}
