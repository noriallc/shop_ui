import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/config/route_arguments.dart';
import 'package:shop_ui/pages/home_page.dart';
import 'package:shop_ui/pages/user_profile_page.dart';
import 'package:shop_ui/pages/shopping_cart_page.dart';
import 'package:shop_ui/pages/favorite_page.dart';
import '../route.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final int cartCount;

  BottomBar({
    required this.currentIndex,
    this.cartCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                spreadRadius: 0,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (e) {
              if (e == 0) {
                go(context, HomePage.routeName);
              }
              if (e == 1) {
                go(context, FavoritePageWidget.routeName,
                    arguments: RouteArguments(title: 'Favorite Items'));
              }
              if (e == 2) {
                go(context, ShoppingCartWidget.routeName);
                //cartCount++;
              }
              if (e == 3) {
                go(context, UserProfilePage.routeName);
              }
            },
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: AppTheme.primaryColor,
            unselectedItemColor: Colors.grey[500],
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(fontSize: 10),
            selectedLabelStyle: TextStyle(fontSize: 10),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Icon(Icons.shopping_cart_outlined),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 13,
                        height: 13,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppTheme.primaryColor,
                        ),
                        child: Text(
                          cartCount.toString(),
                          style: TextStyle(
                            fontSize: 7,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    //ShoppingCartWidget(),
                  ],
                ),
                label: 'Shopping Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'My Profile',
              ),
            ],
          ),
        ));
  }
}
