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
    // Define base text theme using Poppins and specified text colors
    final poppinsTextTheme = GoogleFonts.poppinsTextTheme(
      TextTheme(
        displayLarge: const TextStyle(color: primaryTextColor),
        displayMedium: const TextStyle(color: primaryTextColor),
        displaySmall: const TextStyle(color: primaryTextColor),
        headlineLarge: const TextStyle(color: primaryTextColor),
        headlineMedium: const TextStyle(color: primaryTextColor),
        headlineSmall: const TextStyle(color: primaryTextColor),
        titleLarge: const TextStyle(color: primaryTextColor),
        titleMedium: const TextStyle(color: primaryTextColor),
        titleSmall: const TextStyle(color: primaryTextColor),
        bodyLarge: const TextStyle(color: primaryTextColor),
        bodyMedium: const TextStyle(color: primaryTextColor),
        bodySmall: const TextStyle(color: secondaryTextColor), // Use secondary for less emphasis
        labelLarge: const TextStyle(color: primaryTextColor),
        labelMedium: const TextStyle(color: primaryTextColor),
        labelSmall: const TextStyle(color: secondaryTextColor), // Use secondary for less emphasis
      )
    );

    return GetMaterialApp(
      title: 'Vent Inventory Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark, // Important for overall dark theme
          primary: primaryColor,
          secondary: secondaryColor,
          surface: surfaceColor, // Use surfaceColor for card-like widgets
          background: backgroundColor, // Main background
          error: errorColor,
          onPrimary: primaryTextColor, // Text on primary color
          onSecondary: primaryTextColor, // Text on secondary color
          onSurface: primaryTextColor, // Text on surface color
          onBackground: primaryTextColor, // Text on background color
          onError: primaryTextColor, // Text on error color
        ),
        primaryColor: primaryColor,
        hintColor: accentColor, // For hints, can also be secondaryTextColor
        scaffoldBackgroundColor: backgroundColor, // Use the dark background color
        textTheme: poppinsTextTheme.copyWith(
          // Apply specific font weights as per README
          displayLarge: poppinsTextTheme.displayLarge?.copyWith(fontSize: 57, fontWeight: FontWeight.bold),
          displayMedium: poppinsTextTheme.displayMedium?.copyWith(fontSize: 45, fontWeight: FontWeight.bold),
          displaySmall: poppinsTextTheme.displaySmall?.copyWith(fontSize: 36, fontWeight: FontWeight.bold),
          headlineLarge: poppinsTextTheme.headlineLarge?.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: poppinsTextTheme.headlineMedium?.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
          headlineSmall: poppinsTextTheme.headlineSmall?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          titleLarge: poppinsTextTheme.titleLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
          titleMedium: poppinsTextTheme.titleMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
          titleSmall: poppinsTextTheme.titleSmall?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          bodyLarge: poppinsTextTheme.bodyLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.normal),
          bodyMedium: poppinsTextTheme.bodyMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.normal),
          bodySmall: poppinsTextTheme.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: secondaryTextColor),
          labelLarge: poppinsTextTheme.labelLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          labelMedium: poppinsTextTheme.labelMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
          labelSmall: poppinsTextTheme.labelSmall?.copyWith(fontSize: 11, fontWeight: FontWeight.w500, color: secondaryTextColor),
        ),
        cardTheme: Theme.of(context).cardTheme.copyWith(
          color: cardBackgroundColor, // Use the defined card background color for glassmorphism attempt
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            // Optionally, add a subtle border for better definition in glassmorphism
            // side: BorderSide(color: Colors.white.withOpacity(0.1), width: 0.5),
          ),
          elevation: 0, // Glassmorphism usually relies on blurs, not heavy shadows
          shadowColor: Colors.transparent, //shadowColor, // Shadow might be too heavy for glassmorphism
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent, // Make AppBar transparent for background to show through
          foregroundColor: primaryTextColor, // Text and icon color on AppBar
          elevation: 0, // No shadow for a flatter, modern look
          titleTextStyle: poppinsTextTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold, // As per README (headlines bold)
            color: primaryTextColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surfaceColor.withOpacity(0.5), // Semi-transparent dark fill for inputs
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none, // No border for a cleaner look
          ),
          hintStyle: poppinsTextTheme.bodyMedium?.copyWith(color: secondaryTextColor),
          labelStyle: poppinsTextTheme.bodyMedium?.copyWith(color: secondaryTextColor),
          iconColor: secondaryTextColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: primaryColor, width: 1.0), // Highlight with primary color on focus
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: primaryTextColor, // Text color on button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: poppinsTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        // Define other component themes if needed
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: surfaceColor, // Dark surface for bottom nav
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryTextColor,
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: surfaceColor, // Dark surface for nav rail
          selectedIconTheme: IconThemeData(color: primaryColor),
          unselectedIconTheme: IconThemeData(color: secondaryTextColor),
          selectedLabelTextStyle: poppinsTextTheme.labelSmall?.copyWith(color: primaryColor),
          unselectedLabelTextStyle: poppinsTextTheme.labelSmall?.copyWith(color: secondaryTextColor),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false, // Optional: remove debug banner
    );
  }
}
