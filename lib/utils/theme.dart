import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// https://www.notionavenue.co/post/notion-color-code-hex-palette

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.nunito(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
  displayMedium: GoogleFonts.nunito(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
  displaySmall: GoogleFonts.nunito(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
  bodyLarge: GoogleFonts.nunito(fontSize: 16, color: Colors.black),
  bodyMedium: GoogleFonts.nunito(fontSize: 14, color: Colors.black),
  titleMedium: GoogleFonts.nunito(
    fontSize: 18,
    color: Colors.white,
  ),
  titleSmall: GoogleFonts.nunito(
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
