import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/pages/home_page.dart';
import 'package:shop_ui/pages/login_page.dart';
import 'package:shop_ui/pages/onboarding_page.dart';
import 'package:shop_ui/pages/restaurants_menu_page.dart';
import 'package:shop_ui/pages/shopping_cart_page.dart';
import 'package:shop_ui/pages/start_page.dart';
import 'package:shop_ui/pages/user_profile_page.dart';
import 'package:shop_ui/route.dart';

void main() {
  runApp(MyApp());
}

// https://mir-s3-cdn-cf.behance.net/project_modules/fs/6d11a6104538767.5f68b2108ce4d.png

class MyApp extends StatelessWidget {

  //static GlobalKey myAppKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //key: MyApp.myAppKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: AppTheme.primarySwatch(),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
        ),
      ),
      initialRoute: StartPage.routeName,
      routes: AppRoute.getInstance().routes(),
    );
  }
}
