import 'package:flutter/material.dart';

class StoreChipTheme{
  StoreChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
      checkmarkColor: Colors.white
  );
  ///dark theme
  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.white),
      selectedColor: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
      checkmarkColor: Colors.white
  );
}