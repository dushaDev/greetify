import 'package:flutter/material.dart';
import 'dart:math';

class Greetify extends StatelessWidget {
  /// The user's name to display (optional).
  final String? name;

  /// Custom text style for the greeting.
  final TextStyle? style;

  /// Whether to show the sun/moon icon.
  final bool showIcon;

  /// If true, picks a random greeting from the list.
  /// If false, always picks the first item in the list.
  final bool randomize;

  // Optional custom lists for users to override defaults
  final List<String>? customMorningMessages;
  final List<String>? customAfternoonMessages;
  final List<String>? customEveningMessages;
  final List<String>? customNightMessages;

  const Greetify({
    super.key,
    this.name,
    this.style,
    this.showIcon = false,
    this.randomize = false, // Defaults to false (standard greeting)
    this.customMorningMessages,
    this.customAfternoonMessages,
    this.customEveningMessages,
    this.customNightMessages,
  });

  // --- INTERNAL DEFAULTS ---
  // We keep "Standard" messages at Index 0 so they are used when randomize is false.
  static const List<String> _defaultMorning = [
    "Good Morning", // Index 0 (Default)
    "Rise and Shine",
    "Have a great morning",
    "Top of the morning",
  ];

  static const List<String> _defaultAfternoon = [
    "Good Afternoon", // Index 0 (Default)
    "Hope your day is going well",
    "Stay productive",
    "Good day",
  ];

  static const List<String> _defaultEvening = [
    "Good Evening", // Index 0 (Default)
    "Hope you had a good day",
    "Time to relax",
    "Good evening to you",
  ];

  static const List<String> _defaultNight = [
    "Good Night", // Index 0 (Default)
    "Sweet dreams",
    "Rest well",
    "See you tomorrow",
  ];

  // --- LOGIC ---

  String _getGreetingMessage(int hour) {
    List<String> selectedList;

    // 1. Determine Time Period and Select List (Custom or Default)
    if (hour >= 5 && hour < 12) {
      selectedList = customMorningMessages ?? _defaultMorning;
    } else if (hour >= 12 && hour < 17) {
      selectedList = customAfternoonMessages ?? _defaultAfternoon;
    } else if (hour >= 17 && hour < 21) {
      selectedList = customEveningMessages ?? _defaultEvening;
    } else {
      selectedList = customNightMessages ?? _defaultNight;
    }

    // 2. Handle Empty List Edge Case
    if (selectedList.isEmpty) return "Hello";

    // 3. Pick the string based on 'randomize' flag
    if (randomize) {
      return selectedList[Random().nextInt(selectedList.length)];
    } else {
      // If randomization is off, always use the first greeting (Standard)
      return selectedList.first;
    }
  }

  IconData _getIcon(int hour) {
    if (hour >= 5 && hour < 17) {
      return Icons.wb_sunny;
    } else if (hour >= 17 && hour < 20) {
      return Icons.wb_twilight;
    } else {
      return Icons.nightlight_round;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final String message = _getGreetingMessage(hour);
    final String fullText = name != null ? "$message, $name" : message;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon) ...[
          Icon(_getIcon(hour), color: Colors.orangeAccent),
          const SizedBox(width: 8),
        ],
        Text(
          fullText,
          style:
              style ??
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
