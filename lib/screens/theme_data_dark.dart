import 'package:clashmi/screens/theme_define.dart';
import 'package:flutter/material.dart';

class ThemeDataDark {
  static const Color mainColor = Color(0xFF303030);
  static const Color mainBgColor = Color(0xff121212);
  static ThemeData theme(BuildContext context) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF293CA0),
      brightness: Brightness.dark,
      surface: mainBgColor,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      platform: TargetPlatform.iOS,
      scaffoldBackgroundColor: scheme.surface,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: mainBgColor.withValues(alpha: 0.5),
        filled: true,
        labelStyle: TextStyle(color: Colors.grey),
        floatingLabelStyle: TextStyle(color: ThemeDefine.kColorBlue),
        helperStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey),
        errorStyle: TextStyle(color: Colors.red),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeDefine.kColorBlue),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeDefine.kColorBlue),
            borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
      listTileTheme: ListTileThemeData(dense: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.focused)) {
                return ThemeDefine.kColorBlue[800];
              }
              if (states.contains(WidgetState.selected)) {
                return ThemeDefine.kColorBlue[200];
              }
              return ThemeDefine.kColorBlue;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return Colors.black;
            },
          ),
          shape: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35));
            },
          ),
        ),
      ),
    );
  }
}
