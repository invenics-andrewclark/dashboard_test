// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color accent1;
  late Color accent2;
  late Color faded;
  late Color outlines;
  late Color exampleText;
  late Color lines;
  late Color green;
  late Color red;
  late Color hyperlink;
  late Color textColor50;
  late Color lineColor;
  late Color grayIcon;
  late Color textcolor15;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFF2A213);
  late Color secondaryColor = const Color(0xFFFFD058);
  late Color tertiaryColor = const Color(0xFFFFFBF4);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryBackground = const Color(0xFFF0EBE1);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF000000);
  late Color secondaryText = const Color(0xFF1B1A1A);

  late Color accent1 = Color(0xFFF2A213);
  late Color accent2 = Color(0xFFFFD058);
  late Color faded = Color(0xFFFFFBF4);
  late Color outlines = Color(0xFFDEDEDE);
  late Color exampleText = Color(0xFFA0A0A0);
  late Color lines = Color(0xFFDEDEDE);
  late Color green = Color(0xFFDEDEDE);
  late Color red = Color(0xFFF84949);
  late Color hyperlink = Color(0xFF0075FF);
  late Color textColor50 = Color(0x7F000000);
  late Color lineColor = Color(0xFFDEDEDE);
  late Color grayIcon = Color(0xFF95A1AC);
  late Color textcolor15 = Color(0x26000000);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Poppins';
  TextStyle get title1 => GoogleFonts.getFont(
        'Poppins',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        fontStyle: FontStyle.normal,
      );
  String get title2Family => 'Poppins';
  TextStyle get title2 => GoogleFonts.getFont(
        'Poppins',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get title3Family => 'Poppins';
  TextStyle get title3 => GoogleFonts.getFont(
        'Poppins',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get subtitle1Family => 'Poppins';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Poppins',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get subtitle2Family => 'Poppins';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Poppins',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyText1Family => 'Poppins';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Poppins',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get bodyText2Family => 'Poppins';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Poppins',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
