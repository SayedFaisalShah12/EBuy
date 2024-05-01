import 'package:ebuy/utils/theme/custom_theme/Checkbox_theme.dart';
import 'package:ebuy/utils/theme/custom_theme/appbar_theme.dart';
import 'package:ebuy/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:ebuy/utils/theme/custom_theme/chip_theme.dart';
import 'package:ebuy/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:ebuy/utils/theme/custom_theme/text_field_theme.dart';
import 'package:ebuy/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_theme/Elevated_button_theme.dart';

class Etheme {
    Etheme._();

    static ThemeData lightTheme = ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: ETextTheme.lightTextTheme,
        chipTheme: EChipTheme.lightChipTheme,
        appBarTheme: EAppbar.lightAppBar,
        checkboxTheme: ECheckBoxTheme.lightCheckboxData,
        bottomSheetTheme: EBottonSheetTheme.lightBottomSheetTheme,
        elevatedButtonTheme: EButtonTheme.lightButtonTheme,
        outlinedButtonTheme: EOutLinedButton.lightOutlinedThemeButton,
        inputDecorationTheme: ETextFormField.lightInputDecorationTheme,
    );
    static ThemeData darkTheme = ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: ETextTheme.darkTextTheme,
        chipTheme: EChipTheme.DarkChipTheme,
        appBarTheme: EAppbar.darkAppBar,
        checkboxTheme: ECheckBoxTheme.darkCheckboxData,
        bottomSheetTheme: EBottonSheetTheme.darkBottomSheetTheme,
        elevatedButtonTheme: EButtonTheme.darkButtonTheme,
        outlinedButtonTheme: EOutLinedButton.darkOutlinedThemeButton,
        inputDecorationTheme: ETextFormField.darkInputDecorationTheme,
    );
}