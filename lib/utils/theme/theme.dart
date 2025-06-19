import 'package:flutter/material.dart';
import 'package:t_store/utils/theme/text_theme.dart';
import 'package:t_store/utils/theme/textfield_theme.dart';

import 'appbar_theme.dart';
import 'bottom_sheet_theme.dart';
import 'checkbox_theme.dart';
import 'chip_theme.dart';
import 'elevated_button_theme.dart';
import 'outline_button_theme.dart';

class StoreAppTheme{
  StoreAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: StoreTextTheme.lightTextTheme,
      elevatedButtonTheme: StoreElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: StoreAppBarTheme.lightAppBarTheme,
      checkboxTheme: StoreCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: StoreBottomSheetTheme.lightBottomSheetTheme,
      inputDecorationTheme: StoreTextFormFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: StoreOutlinedButtonTheme.lightOutlineButtonTheme,
      chipTheme: StoreChipTheme.lightChipTheme

  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: StoreTextTheme.darkTextTheme,
      elevatedButtonTheme: StoreElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: StoreAppBarTheme.darkAppBarTheme,
      checkboxTheme: StoreCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: StoreBottomSheetTheme.darkBottomSheetTheme,
      inputDecorationTheme: StoreTextFormFieldTheme.darkInputDecorationTheme,
      outlinedButtonTheme: StoreOutlinedButtonTheme.darkOutlinedButtonTheme,
      chipTheme: StoreChipTheme.darkChipTheme
  );
}