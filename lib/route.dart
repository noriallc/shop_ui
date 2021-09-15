import 'package:flutter/material.dart';
import 'package:shop_ui/pages/categories_page.dart';
import 'package:shop_ui/pages/favorite_page.dart';
import 'package:shop_ui/pages/home_page.dart';
import 'package:shop_ui/pages/login_page.dart';
import 'package:shop_ui/pages/onboarding_page.dart';
import 'package:shop_ui/pages/product_item.dart';
import 'package:shop_ui/pages/restaurants_menu_page.dart';
import 'package:shop_ui/pages/shopping_cart_page.dart';
import 'package:shop_ui/pages/start_page.dart';
import 'package:shop_ui/pages/user_profile_page.dart';

import 'config/route_arguments.dart';


class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );
}

class AppRoute {
  static AppRoute? _instance;

  String? currentRoute;

  AppRoute._();
  static AppRoute getInstance() {
    return _instance ??= AppRoute._();
  }

  routes() {
    return {
      HomePage.routeName: (_) => HomePage(),
      CategoriesPage.routeName: (_) => CategoriesPage(),
      ProductItem.routeName: (_) => ProductItem(),
      ShoppingCartWidget.routeName: (_) => ShoppingCartWidget(),
      FavoritePageWidget.routeName: (_) => FavoritePageWidget(),
      UserProfilePage.routeName: (_) => UserProfilePage(),
      LoginPage.routeName: (_) => LoginPage(),
      StartPage.routeName: (_) => StartPage(),
      OnboardingPage.routeName: (_) => OnboardingPage(),
      RestaurantsMenuPage.routeName: (_) => RestaurantsMenuPage(),
    };
  }
}

go(context, String routeName, {RouteArguments? arguments}) {

  String name = AppRoute.getInstance().currentRoute ?? "";
  //if (routeName != name) {
    AppRoute.getInstance().currentRoute = routeName;
    print("$name -> $routeName");

  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (ok) => AppRoute.getInstance().routes()[routeName](),
  //     settings: RouteSettings(
  //       arguments: arguments,
  //     ),
  //   ),
  // );

    Navigator.pushNamed(context, routeName, arguments: arguments);
  //}
}

goReplace(context, String routeName) {
  String name = AppRoute.getInstance().currentRoute ?? "";
  if (routeName != name) {
    AppRoute.getInstance().currentRoute = routeName;
    print("$name -> $routeName");
    Navigator.pushReplacementNamed(context, routeName);
  }
}

goBack(context) {
  Navigator.pop(context);
}



