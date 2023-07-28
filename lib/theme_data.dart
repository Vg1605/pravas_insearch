import 'package:flutter/material.dart';
import 'package:pravas/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PravasThemeData {
  static ThemeData themeDataDark({
    String? fontFamily,
  }) {
    return ThemeData(
      primaryColor: PravasDarkColors().cardColor,
      scaffoldBackgroundColor: PravasDarkColors().scaffoldBackgroundColor,
      colorScheme: ColorScheme(
          primary: PravasDarkColors().primary,
          onPrimary: PravasDarkColors().onPrimary,
          secondary: PravasDarkColors().bottomBar,
          onTertiary: Colors.transparent,
          onSecondary: PravasDarkColors().textGrayColor,
          error: PravasDarkColors().error,
          brightness: Brightness.dark,
          onError: PravasDarkColors().error,
          background: PravasDarkColors().backGround,
          onBackground: PravasDarkColors().backGround,
          surface: PravasDarkColors().text,
          onSurface: PravasDarkColors().onText),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: PravasDarkColors().primary),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.only(top: 1),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 1.dp, color: PravasDarkColors().onText.withOpacity(0.7)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 1.dp, color: PravasDarkColors().primary),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1.dp, color: PravasDarkColors().error),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.dp),
            ),
            foregroundColor: PravasLightColors().text,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(3.5.dp),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.dp),
              ),
              padding: EdgeInsets.zero,
              foregroundColor: PravasLightColors().primary)),

      /*  textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.dp),
              ),
              padding: EdgeInsets.zero,
              foregroundColor: PravasDarkColors().primary)),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.dp),
            ),
            foregroundColor: PravasLightColors().text,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(3.5.dp),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      ),*/
    );
  }

  static ThemeData themeDataLight({
    String? fontFamily,
  }) {
    return ThemeData(
      primaryColor: PravasLightColors().primaryColor,
      scaffoldBackgroundColor: PravasLightColors().scaffoldBackgroundColor,
      colorScheme: ColorScheme(
        primary: PravasLightColors().primary,
        onPrimary: PravasLightColors().onPrimary,
        secondary: PravasLightColors().bottomBar,
        onSecondary: PravasLightColors().textGrayColor,
        error: PravasLightColors().error,
        brightness: Brightness.light,
        onTertiary: Colors.transparent,
        onError: PravasLightColors().error,
        background: PravasLightColors().backGround,
        onBackground: PravasLightColors().backGround,
        surface: PravasLightColors().text,
        onSurface: PravasLightColors().onText,
      ),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: PravasLightColors().primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
      /* inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.only(top: 1),
        constraints: BoxConstraints(maxHeight: 70.dp),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: PravasDarkColors().onPrimary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: PravasDarkColors().primary),
        ),
        */ /*errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: MyColors().error),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: MyColors().error),
          ),*/ /*
        //hintStyle: MyTextThemeStyle.bodyText2(MyColors().caption),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          //  maximumSize: Size(80.w, 50.dp),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.dp),
              ),
              padding: EdgeInsets.zero,
              foregroundColor: PravasDarkColors().primary)),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.dp),
            ),
            foregroundColor: PravasLightColors().text,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(3.5.dp),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      ),*/
    );
  }
}
