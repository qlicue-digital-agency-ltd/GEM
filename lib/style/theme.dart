import 'package:flutter/material.dart';

class ArchSampleTheme {
  static get theme {
    final originalTextTheme = ThemeData.light().textTheme;
    final originalBody1 = originalTextTheme.bodyText1;

    return ThemeData.light().copyWith(
        primaryColor: Color(0xFF00d0cb),
        accentColor: Colors.white,
        buttonColor: Colors.cyan[300],
        textSelectionColor: Colors.cyan[100],
        backgroundColor: Colors.grey[800],
        toggleableActiveColor: Colors.cyan[300],
        textTheme: originalTextTheme.copyWith(
            bodyText1:
                originalBody1.copyWith(decorationColor: Colors.transparent)));
  }
}
