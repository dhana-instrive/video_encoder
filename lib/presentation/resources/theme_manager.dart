import 'package:flutter/material.dart';

import 'style_manager.dart';
import 'values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';


const String THEME_LIGHT = "THEME_LIGHT";
const String THEME_DARK = "THEME_DARK";
const String THEME_GREY = "THEME_GREY";
const String THEME_COLORFUL = "THEME_COLORFUL";

ThemeData getApplicationTheme(String theme){

  Color white = ColorManger.white;
  Color textColor = ColorManger.darkGrey;
  Color darkPrimary = ColorManger.darkPrimary;
  Color shadowColor = ColorManger.grey;
  Color splashColor = ColorManger.lightGrey;
  Color modalWidgetsBGColor = ColorManger.white;
  Color cardColor = ColorManger.lightGrey;
  Color canvasColor = ColorManger.lightGrey;

  switch(theme){
    case THEME_DARK : {
      white = ColorManger.black;
      textColor = ColorManger.white;
      shadowColor = ColorManger.grey;
      canvasColor = ColorManger.black2;
      darkPrimary = ColorManger.grey1;
      modalWidgetsBGColor = ColorManger.black2;
      splashColor = ColorManger.darkGrey;
      cardColor = ColorManger.black2;
    }
    break;
    case THEME_GREY : {
      white = ColorManger.grey;
      textColor = ColorManger.darkGrey;
      darkPrimary = ColorManger.grey2;
    }
    break;
    case THEME_COLORFUL : {
      white = ColorManger.primary2;
      textColor = ColorManger.white;
      darkPrimary = ColorManger.darkPrimary2;
    }
  }

  return ThemeData(
    // main colors of the app
    primaryColor: ColorManger.primary,
    primaryColorLight: ColorManger.primaryOpacity70,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.grey1,
    scaffoldBackgroundColor: white,
    cardColor: cardColor,
    canvasColor: canvasColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: ColorManger.grey,
        primary: ColorManger.primary,
    ),
    primarySwatch: ColorManger.getSwatch(color: ColorManger.primary),
    unselectedWidgetColor: ColorManger.grey1,
    //ripple color
    splashColor: splashColor,
    // card view theme
    cardTheme: CardTheme(
      color: white,
      shadowColor: shadowColor,
      elevation: AppSize.s4
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: ColorManger.white,
      textStyle: getMediumStyle(color: ColorManger.black, fontSize: FontSize.s16),
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: white,
      actionsIconTheme: IconThemeData(color: ColorManger.grey),
      foregroundColor: textColor,
      elevation: 0,
      shadowColor: shadowColor,
      titleTextStyle: getRegularStyle(color: textColor, fontSize: FontSize.s16),
      toolbarTextStyle: getRegularStyle(color: ColorManger.primary, fontSize: FontSize.s12)
    ),
    shadowColor: shadowColor,
    // button theme
    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(),
      disabledColor: ColorManger.grey1,
      buttonColor: ColorManger.primary,
      splashColor: ColorManger.primaryOpacity70
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        textStyle: getRegularStyle(color: white, fontSize: FontSize.s16),
        backgroundColor: ColorManger.btnColor,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s4))
      )
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(getRegularStyle(color: ColorManger.btnColor, fontSize: FontSize.s14)),
        foregroundColor: MaterialStateProperty.all(ColorManger.btnColor)
      ),
    ),
    // text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(color: textColor, fontSize: FontSize.s16),
      headline2: getBoldStyle(color: textColor, fontSize: FontSize.s20),
      headline3: getBoldStyle(color: textColor, fontSize: FontSize.s22),
      headline4: getBoldStyle(color: textColor, fontSize: FontSize.s24),
      headline5: getBoldStyle(color: textColor, fontSize: FontSize.s26),
      subtitle1: getMediumStyle(color: darkPrimary, fontSize: FontSize.s16),
      subtitle2: getMediumStyle(color: textColor, fontSize: FontSize.s16),
      caption: getRegularStyle(color: ColorManger.grey1),
      bodyText1: getRegularStyle(color: ColorManger.grey),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s20),
          topRight: Radius.circular(AppSize.s20),
        )
      ),
      modalElevation: AppSize.s4,
      modalBackgroundColor: modalWidgetsBGColor,
      backgroundColor: Colors.black45
    ),
    dialogTheme: DialogTheme(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular(AppSize.s20) )
      ),
      elevation: 2,
      backgroundColor: modalWidgetsBGColor
    ),
    dividerColor: shadowColor,
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p18),
      hintStyle: getMediumStyle(color: ColorManger.grey, fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManger.darkGrey),
      errorStyle: getRegularStyle(color: ColorManger.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: splashColor, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s4))
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: splashColor, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s4))
      ),
      errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s4))
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.primary, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s4))
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorManger.primary,
      unselectedItemColor: ColorManger.grey,
      backgroundColor: white,
      elevation: 20,
    )
  );


}