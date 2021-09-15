import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_ui/config/app_theme.dart';
import 'package:shop_ui/pages/onboarding_page.dart';
import 'package:shop_ui/widgets/app_widgets.dart';
import '../route.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80, bottom: 80),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(),
                child: Text(
                  'Log in',
                  textAlign: TextAlign.center,
                  style: AppTheme.title1.override(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: AppTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0x7D303030),
                        fontSize: 14,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: AppTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0x7D303030),
                      fontSize: 14,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: AppTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0x7D303030),
                        fontSize: 14,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility = !passwordVisibility,
                        ),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: AppTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0x7D303030),
                      fontSize: 14,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    AppButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Forgot password?',
                      options: AppButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0x0009B44D),
                        textStyle: AppTheme.subtitle2.override(
                          fontFamily: 'Poppins',

                          fontWeight: FontWeight.bold,
                          //color: AppTheme.customColor1,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 30, right: 40),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AppButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                    go(context, HomePage.routeName);
                  },
                  text: 'Log in',
                  options: AppButtonOptions(
                    width: double.infinity,
                    height: 45,
                    color: AppTheme.primaryColor,
                    textStyle: AppTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 30,
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 40, top: 90, right: 40),
                child: GestureDetector(
                  onTap: () {
                    print("Tapped a Container");
                    go(context, HomePage.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 70),
                              child: GestureDetector(
                                onTap: () {
                                  go(context, OnboardingPage.routeName);
                                },
                                child: Text(
                                'Log in with Google',
                                textAlign: TextAlign.center,
                                style: AppTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Color(0x7D303030),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppTheme.secondaryColor,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Image.network(
                                        'https://i.imgur.com/Nco4YNM.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 15, right: 40),
              child: GestureDetector(
                onTap: () {
                  print("Tapped a Container");
                  go(context, HomePage.routeName);
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: GestureDetector(
                              onTap: () {
                                go(context, OnboardingPage.routeName);
                              },
                              child: Text(
                              'Log in with Facebook',
                              textAlign: TextAlign.center,
                              style: AppTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0x7D303030),
                              ),
                            ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryColor,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 5, 5),
                                    child: Image.network(
                                      'https://i.imgur.com/E5gQ5VS.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40, left: 40, top: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: AppTheme.bodyText1.override(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  AppButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Join now',
                    options: AppButtonOptions(
                      width: 90,
                      color: Color(0x0009B44D),
                      textStyle: AppTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        //color: AppTheme.customColor1,
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 30,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
