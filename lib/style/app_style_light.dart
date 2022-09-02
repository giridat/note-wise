import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightMode {
  static Color bgColor = const Color(0x0000ffff);
  static Color mainColor = const Color(0x00ff0065);
  static Color accentColor = const Color(0x00ff0065);

  // static Color mainColor = const Color(0x00ff0063);

  static List<Color> cardsColor = [
    Colors.black,
    Colors.red.shade400,
    Colors.pinkAccent.shade200,
    Colors.orangeAccent.shade200,
    Colors.yellowAccent.shade200,
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.blueAccent.shade200,
  ];

  static TextStyle mainTitle = GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.bold, color: cardsColor.first);

  static TextStyle mainContent = GoogleFonts.nunito(
      fontSize: 16, fontWeight: FontWeight.normal, color: cardsColor.first);

  static TextStyle dateTitle = GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.bold, color: cardsColor.first);

// static TextStyle mainTitle =
//     GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold);
}
