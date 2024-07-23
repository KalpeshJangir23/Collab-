import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// https://www.notionavenue.co/post/notion-color-code-hex-palette

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.openSans(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
  displayMedium: GoogleFonts.openSans(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
  displaySmall: GoogleFonts.openSans(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
  bodyLarge: GoogleFonts.openSans(fontSize: 16, color: Colors.black),
  bodyMedium: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
  titleMedium: GoogleFonts.openSans(
    fontSize: 18,
    color: Colors.white,
  ),
  titleSmall: GoogleFonts.openSans(
    fontSize: 16,
    color: Colors.white,
  ),
);

const ColorScheme myColorScheme = ColorScheme(
  primary: Colors.blue, //used
  primaryContainer: Colors.blueAccent,
  secondary: Colors.green,
  secondaryContainer: Colors.greenAccent,
  surface: Colors.white,
  background: Color(0xff2f3438), //used
  error: Colors.red,
  onPrimary: Colors.white, // used
  onSecondary: Colors.white,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
  outline: Color(0xff787774), //used
);
