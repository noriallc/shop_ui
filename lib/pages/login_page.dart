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
            _title(),
            _inputEmail(),
            20.height,
            _inputPassword(),
            _forgotPassword(),
            30.height,
            _logInButton(),
            90.height,
            _button('Google', 'https://i.imgur.com/Nco4YNM.png'),
            15.height,
            _button("Facebook", 'https://i.imgur.com/E5gQ5VS.png'),
            15.height,
            _text(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Padding(
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
    );
  }

  Widget _inputEmail() {
    return Padding(
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
    );
  }

  Widget _inputPassword() {
    return Padding(
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
    );
  }

  Widget _forgotPassword() {
    return Padding(
      padding: EdgeInsets.only(left: 55, top: 2),
      child: Container(
        width: double.infinity,
        height: 30,
        child: GestureDetector(
            onTap: () {
              //go(context, OnboardingPage.routeName);
            },
            child: Row(
              children: [
                Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: AppTheme.darkBGColor,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _logInButton() {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: AppTheme.tertiaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AppButtonWidget(
          onPressed: () {
            goReplace(context, HomePage.routeName);
          },
          text: 'Log in',
          options: AppButtonOptions(
            width: double.infinity,
            height: 45,
            color: AppTheme.primaryColor,
            textStyle: AppTheme.subtitle2.override(
              fontFamily: 'Poppins',
              color: AppTheme.tertiaryColor,
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
    );
  }

  Widget _button(String text, String image) {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            AppButtonWidget(
              onPressed: () {
                goReplace(context, HomePage.routeName);
              },
              text: 'Log in with $text',
              options: AppButtonOptions(
                width: double.infinity,
                height: 45,
                color: AppTheme.secondaryColor,
                textStyle: AppTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Color(0x7D303030),
                  fontSize: 14,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 30,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.8, 0),
              child: Container(
                width: 25,
                height: 25,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return Padding(
      padding: EdgeInsets.only(right: 40, left: 40),
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
          GestureDetector(
              onTap: () {
                go(context, OnboardingPage.routeName);
              },
              child: Row(
                children: [
                  Text(
                    ' Join now',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      //color: AppTheme.customColor1,
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
