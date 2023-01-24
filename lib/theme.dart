import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color firePrimaryColor = HexColor('#A31C1C');
Color fireSecondaryColor = HexColor('C94921');

Color airPrimaryColor = HexColor('#FFFB17');
Color airSecondaryColor = HexColor('#FEFDBE');

Color waterPrimaryColor = HexColor('#47559C');
Color waterSecondaryColor = HexColor('#6FC7DA');

Color earthPrimaryColor = HexColor('#1F4921');
Color earthSecondaryColor = HexColor('#A2D6A4');

var fireTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: firePrimaryColor,
        onPrimary: Colors.black,
        secondary: fireSecondaryColor,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.black,
        background: Colors.black,
        onBackground: Colors.white,
        surface: firePrimaryColor,
        onSurface: Colors.black));

var airTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: airPrimaryColor,
        onPrimary: Colors.black,
        secondary: airSecondaryColor,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.black,
        onBackground: Colors.white,
        surface: airPrimaryColor,
        onSurface: Colors.black));

var waterTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: waterPrimaryColor,
        onPrimary: Colors.black,
        secondary: waterSecondaryColor,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.black,
        onBackground: Colors.white,
        surface: waterPrimaryColor,
        onSurface: Colors.black));

var earthTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: earthPrimaryColor,
        onPrimary: Colors.black,
        secondary: earthSecondaryColor,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.black,
        onBackground: Colors.white,
        surface: earthPrimaryColor,
        onSurface: Colors.black));
