// Import paket Flutter dan Google Fonts.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Definisikan warna utama dan warna sekunder sebagai konstanta.
const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFF6B38FB);

// Tentukan tema teks kustom menggunakan Google Fonts.
final TextTheme myTextTheme = TextTheme(
  // Gaya teks untuk tampilan besar.
  displayLarge: GoogleFonts.merriweather(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  // Gaya teks untuk tampilan medium.
  displayMedium: GoogleFonts.merriweather(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  // Gaya teks untuk tampilan kecil.
  displaySmall:
      GoogleFonts.merriweather(fontSize: 46, fontWeight: FontWeight.w400),
  // Gaya teks untuk headline medium.
  headlineMedium: GoogleFonts.merriweather(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  // Gaya teks untuk headline kecil.
  headlineSmall:
      GoogleFonts.merriweather(fontSize: 23, fontWeight: FontWeight.w400),
  // Gaya teks untuk judul besar.
  titleLarge: GoogleFonts.merriweather(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  // Gaya teks untuk judul medium.
  titleMedium: GoogleFonts.merriweather(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  // Gaya teks untuk judul kecil.
  titleSmall: GoogleFonts.merriweather(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  // Gaya teks untuk tubuh besar.
  bodyLarge: GoogleFonts.libreFranklin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  // Gaya teks untuk tubuh medium.
  bodyMedium: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  // Gaya teks untuk label besar.
  labelLarge: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  // Gaya teks untuk tubuh kecil.
  bodySmall: GoogleFonts.libreFranklin(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  // Gaya teks untuk label kecil.
  labelSmall: GoogleFonts.libreFranklin(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
