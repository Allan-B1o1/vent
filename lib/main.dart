import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vent/app/app_pages.dart';
import 'package:vent/theme/color_schemes.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart'; // Removed Firebase dependency

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vent Inventory Manager',
      theme: ThemeData(
        primaryColor: primaryColor,
        hintColor: accentColor,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.poppins(
              fontSize: 57, fontWeight: FontWeight.bold, color: primaryTextColor),
          displayMedium: GoogleFonts.poppins(
              fontSize: 45, fontWeight: FontWeight.bold, color: primaryTextColor),
          displaySmall: GoogleFonts.poppins(
              fontSize: 36, fontWeight: FontWeight.bold, color: primaryTextColor),
          headlineLarge: GoogleFonts.poppins(
              fontSize: 32, fontWeight: FontWeight.bold, color: primaryTextColor),
          headlineMedium: GoogleFonts.poppins(
              fontSize: 28, fontWeight: FontWeight.bold, color: primaryTextColor),
          headlineSmall: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.bold, color: primaryTextColor),
          titleLarge: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.w500, color: primaryTextColor),
          titleMedium: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w500, color: primaryTextColor),
          titleSmall: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w500, color: primaryTextColor),
          bodyLarge: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.normal, color: primaryTextColor),
          bodyMedium: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.normal, color: primaryTextColor),
          bodySmall: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.normal, color: secondaryTextColor),
          labelLarge: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w500, color: primaryTextColor),
          labelMedium: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w500, color: primaryTextColor),
          labelSmall: GoogleFonts.poppins(
              fontSize: 11, fontWeight: FontWeight.w500, color: secondaryTextColor),
        ),
        cardTheme: Theme.of(context).cardTheme.copyWith(
          color: cardBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 4.0,
          shadowColor: shadowColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: primaryTextColor,
          elevation: 0,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: GoogleFonts.poppins(color: secondaryTextColor),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor, // Use primaryColor for ElevatedButton
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: primaryTextColor,
            ),
          ),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
