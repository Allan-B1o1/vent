import 'package:flutter/material.dart';

// Global Design Theme from README.md
// Background: #121212
// Primary: #00BCD4
// Secondary: #FF9800
// Accent: #4CAF50
// Text (Primary): #FFFFFF
// Text (Secondary): #B0BEC5

const Color backgroundColor = Color(0xFF121212);
const Color primaryColor = Color(0xFF00BCD4);
const Color secondaryColor = Color(0xFFFF9800);
const Color accentColor = Color(0xFF4CAF50);

const Color primaryTextColor = Color(0xFFFFFFFF);
const Color secondaryTextColor = Color(0xFFB0BEC5);

// Card Background: For glassmorphism, this might be a semi-transparent version of background
// For a minimalist approach, it could be a slightly lighter shade of the background or a dark grey.
// Let's start with a semi-transparent black for a subtle glass effect.
const Color cardBackgroundColor = Color(0x1AFFFFFF); // White with low opacity to blend with dark background
const Color surfaceColor = Color(0xFF1E1E1E); // Slightly lighter than background for surfaces

// Shadow for subtle depth on dark theme
const Color shadowColor = Color(0x1F000000); // Very soft black shadow, might need adjustment for dark theme visibility

// Status Colors (can remain similar, ensure contrast on dark background)
const Color successColor = Color(0xFF4CAF50);   // Accent color can double as success
const Color warningColor = Color(0xFFFF9800);   // Secondary color can double as warning
const Color errorColor = Color(0xFFD32F2F);     // Muted Red for errors (ensure visibility)
