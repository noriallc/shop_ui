import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/widgets/app_widgets.dart';
import '../route.dart';
import 'home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  static const routeName = '/onboarding';

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentPage = 0;

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
              child: Container(
                width: double.infinity,
                //height: 500,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Stack(
                  children: [
                    PageView(
                      controller: pageViewController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onchanged,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 5),
                              child: Container(
                                width: double.infinity,
                                //height: 450,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.5,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      'https://i.imgur.com/Hvek7Qe.jpg',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 50,
                                      color: Colors.black,
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(200),
                                    bottomRight: Radius.circular(200),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50, 50, 50, 0),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.2,
                                  ),
                                  child: Text(
                                    'Choose your favorite dishes from the nearest restaurant or cafe',
                                    textAlign: TextAlign.center,
                                    style: AppTheme.title2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                color:AppTheme.tertiaryColor,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    'https://i.imgur.com/Nen335I.jpg',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 50,
                                    //color: AppTheme.customColor1,
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(200),
                                  bottomRight: Radius.circular(200),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(50, 50, 50, 0),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0, -1),
                                child: Text(
                                  'Taste fresh delicious meals anytime and everywhere',
                                  textAlign: TextAlign.center,
                                  style: AppTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                color:AppTheme.tertiaryColor,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    'https://i.imgur.com/8kXkJ6A.jpg',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 50,
                                    //color: AppTheme.customColor1,
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(200),
                                  bottomRight: Radius.circular(200),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(50, 50, 50, 0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0, -1),
                                child: Text(
                                  'We also deliver food and drinks from the nearest supermarket',
                                  textAlign: TextAlign.center,
                                  style: AppTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageViewController,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) {
                            pageViewController.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: ExpandingDotsEffect(
                            expansionFactor: 4,
                            spacing: 8,
                            radius: 16,
                            dotWidth: 7,
                            dotHeight: 7,
                            dotColor: Color(0x7F09B44D),
                            activeDotColor: AppTheme.primaryColor,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.tertiaryColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: AppButtonWidget(
                      onPressed: () {
                        (_currentPage == 2) ? go(context, HomePage.routeName):
                        pageViewController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuint);
                      },
                      text: 'NEXT',
                      options: AppButtonOptions(
                        width: double.infinity,
                        height: 45,
                        color: AppTheme.primaryColor,
                        textStyle: AppTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color:AppTheme.tertiaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: GestureDetector(
                      onTap: () {
                        go(context, HomePage.routeName);
                      },
                      child: Text(
                        'SKIP',
                        textAlign: TextAlign.center,
                        style: AppTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
