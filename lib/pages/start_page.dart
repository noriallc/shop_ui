import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/pages/login_page.dart';
import 'package:shop_ui/route.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  static const routeName = '/start';

  @override
  _StartPageState createState() => _StartPageState();
}


class _StartPageState extends State<StartPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      goReplace(context, LoginPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.tertiaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  'https://i.imgur.com/9SSDiXD.png',
                ).image,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'easy',
                          style: AppTheme.title1.override(
                            fontFamily: 'Poppins',
                            color: AppTheme.tertiaryColor,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          'eat',
                          textAlign: TextAlign.start,
                          style: AppTheme.title1.override(
                            fontFamily: 'Poppins',
                            color: AppTheme.tertiaryColor,
                            fontSize: 40,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
}

