import 'package:flutter/material.dart';
import 'dart:math';

class Greetify extends StatelessWidget {
  /// The user's name to display.
  final String? name;

  /// Custom text style for the greeting.
  final TextStyle? style;

  /// Whether to show the sun/moon icon.
  final bool showIcon;

  final bool showIconRight;

  /// If true, picks a random greeting from the list.
  /// If false, always picks the first item in the list.
  final bool randomize;

  final List<String>? customMorningMessages;
  final List<String>? customAfternoonMessages;
  final List<String>? customEveningMessages;
  final List<String>? customNightMessages;

  /// Callback to be executed when the greeting is tapped.
  final VoidCallback? onTap;

  final Color? splashColor;
  final Color? hoverColor;

  /// Callback to be executed when the greeting is hovered.
  final Function(bool?)? onHover;

  /// Callback to be executed when the greeting is long-pressed.
  final VoidCallback? onLongPress;

  const Greetify({
    super.key,
    this.name,
    this.style,
    this.showIcon = false,
    this.showIconRight = false,
    this.randomize = false,
    this.customMorningMessages,
    this.customAfternoonMessages,
    this.customEveningMessages,
    this.customNightMessages,
    this.onTap,
    this.onHover,
    this.onLongPress,
    this.splashColor,
    this.hoverColor,
  });

  //INTERNAL DEFAULTS
  static const List<String> _defaultMorning = [
    "Good Morning",
    "Rise and Shine",
    "Have a great morning",
    "Hope your day is bright",
  ];

  static const List<String> _defaultAfternoon = [
    "Good Afternoon",
    "Hope your day is going well",
    "Welcome back",
    "Good day",
  ];

  static const List<String> _defaultEvening = [
    "Good Evening",
    "Hope you had a good day",
    "Time to relax",
    "Good evening to you",
  ];

  static const List<String> _defaultNight = [
    "Good Night",
    "Sweet dreams",
    "Have a restful night",
    "See you tomorrow",
  ];

  String _getGreetingMessage(int hour) {
    List<String> selectedList;

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

    if (randomize) {
      return selectedList[Random().nextInt(selectedList.length)];
    } else {
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

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: splashColor,
        hoverColor: hoverColor,
        onTap: onTap,
        onHover: onHover,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            textDirection:
                showIconRight ? TextDirection.rtl : TextDirection.ltr,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIcon) ...[
                Icon(_getIcon(hour), color: Colors.orangeAccent),
                const SizedBox(width: 8),
              ],
              Text(
                fullText,
                style: style ??
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
