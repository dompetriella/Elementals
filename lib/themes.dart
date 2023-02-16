import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const String firePrimaryColor = '#A31C1C';
const String fireSecondaryColor = '#C97221';
const String fireTertriaryColor = '#631111';

const String airPrimaryColor = '#7451A1';
const String airSecondaryColor = '#BD9BD2';
const String airTertriaryColor = '#462E65';

const String waterPrimaryColor = '#47559C';
const String waterSecondaryColor = '#6FC7DA';
const String waterTertriaryColor = '#2A3364';

const String earthPrimaryColor = '#3F8342';
const String earthSecondaryColor = '#A2D6A4';
const String earthTertriaryColor = '#132F14';

var fireTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: HexColor(firePrimaryColor),
        onPrimary: Colors.white,
        secondary: HexColor(fireSecondaryColor),
        onSecondary: Colors.black,
        tertiary: HexColor(fireTertriaryColor),
        onTertiary: Colors.white,
        error: Colors.red,
        onError: Colors.black,
        background: Colors.black,
        onBackground: Colors.white,
        surface: HexColor(firePrimaryColor),
        onSurface: Colors.black));

var airTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: HexColor(airPrimaryColor),
        onPrimary: Colors.white,
        secondary: HexColor(airSecondaryColor),
        tertiary: HexColor(airTertriaryColor),
        onTertiary: Colors.white,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.black,
        background: Colors.black,
        onBackground: Colors.white,
        surface: HexColor(airPrimaryColor),
        onSurface: Colors.black));

var waterTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: HexColor(waterPrimaryColor),
        onPrimary: Colors.white,
        secondary: HexColor(waterSecondaryColor),
        onSecondary: Colors.black,
        tertiary: HexColor(waterTertriaryColor),
        onTertiary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.black,
        onBackground: Colors.white,
        surface: HexColor(waterPrimaryColor),
        onSurface: Colors.black));

var earthTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: HexColor(earthPrimaryColor),
        onPrimary: Colors.white,
        secondary: HexColor(earthSecondaryColor),
        onSecondary: Colors.black,
        tertiary: HexColor(earthTertriaryColor),
        onTertiary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.black,
        onBackground: Colors.white,
        surface: HexColor(earthPrimaryColor),
        onSurface: Colors.black));
