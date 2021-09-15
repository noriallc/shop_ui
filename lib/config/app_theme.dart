import 'package:flutter/material.dart';

class AppTheme {

  static const primaryColor = Color(0xff09b44d);
  static const secondaryColor = Color(0xFFD0F1DD);
  static const tertiaryColor = Color(0xFFF6F6F6);
  static const white = Color(0xFFffffff);
  static const grayBGColor = Color(0xFF95a1ac);
  static const darkBGColor = Color(0xFF1a1f24);
  static const primaryBlack = Color(0xFF262626);

  static imageOverlay ({double? radius, AlignmentGeometry? begin, AlignmentGeometry? end, List<Color>? colors}){
    final List<Color> _colors = colors ?? [
      Color.fromARGB(210, 0, 0, 0),
      Color.fromARGB(0, 0, 0, 0),
    ];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 12),
        gradient: LinearGradient(
          colors: _colors,
          begin: begin ?? Alignment.bottomCenter,
          end: end ?? Alignment.topCenter,
        ),
      ),
      alignment: Alignment(0, 0),
    );
  }

  static MaterialColor materialColor(Color color) {
    final int r = color.red, g = color.green, b = color.blue;
    Map<int, Color> swatch = <int, Color>{};
    for (double opacity = 0.1; opacity < 1.0; opacity += 0.1) {
      int index = (opacity > 0.1 ? ((opacity - 0.1) * 1000) : 50).round();
      swatch[index] = Color.fromRGBO(r, g, b, opacity);
    }
    return MaterialColor(color.value, swatch);
  }

  static Color hexColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static MaterialColor primarySwatch() {
    return materialColor(AppTheme.primaryColor);
  }

  static TextStyle get title1 {
    return TextStyle(
      fontSize: 24.0,
      color: Color(0xFF303030),
      fontWeight: FontWeight.w600,
      fontFamily: "Roboto",
    );
  }

  static TextStyle get title2 {
    return TextStyle(
      fontSize: 22.0,
      color: Color(0xFF303030),
      fontWeight: FontWeight.w500,
      fontFamily: "Roboto",
    );
  }

  static TextStyle get title3 {
    return TextStyle(
      fontSize: 20.0,
      color: Color(0xFF303030),
      fontWeight: FontWeight.w500,
      fontFamily: "Roboto",
    );
  }

  static TextStyle get subtitle1 {
    return TextStyle(
      fontSize: 18.0,
      color: Color(0xFF757575),
      fontWeight: FontWeight.w500,
      fontFamily: "Roboto",
    );
  }

  static TextStyle get subtitle2 {
    return TextStyle(
      fontSize: 16.0,
      color: Color(0xFF616161),
      fontWeight: FontWeight.w400,
      fontFamily: "Roboto",
    );
  }

  static TextStyle get bodyText1 {
    return TextStyle(
      fontSize: 14.0,
      color: Color(0xFF303030),
      fontWeight: FontWeight.w400,
      fontFamily: "Roboto",
    );
  }

  static TextStyle get bodyText2 {
    return TextStyle(
      fontSize: 16.0,
      color: const Color(0xFF424242),
      fontWeight: FontWeight.w400,
      fontFamily: "Roboto",
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle override({
    Color? color,
    String? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: color ?? this.color,
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}


