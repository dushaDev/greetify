
# Greetify

Greetify is a flexible and lightweight Flutter package that provides dynamic, time-aware greetings for your application. It automatically detects the time of day to display appropriate messages (e.g., "Good Morning", "Good Evening") and includes features for randomization and custom message lists.

This package is ideal for dashboard headers, welcome screens, and home pages where a personalized user experience is required.

## Features

- **Time-Aware Logic:** Automatically determines if it is morning, afternoon, evening, or night based on the device system time.
- **Dynamic Icons:** Renders appropriate icons (sun or moon) alongside the text based on the time of day.
- **Randomization:** Optional feature to cycle through a list of greetings to keep the UI fresh.
- **Customization:** Full support for overriding default messages with custom lists for specific times of day.
- **Styling:** Accepts standard Flutter text styling to match your application's design system.

## Installation

Add `greetify` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  greetify: ^0.0.1


Then, run the following command in your terminal:

```bash
flutter pub get
```

## Usage

Import the package where you intend to use it:

```dart
import 'package:greetify/greetify.dart';
```

### 1. Basic Usage

The simplest implementation checks the time and displays a standard greeting (e.g., "Good Morning").

```dart
Greetify(
  name: "User",
)
```

### 2. Custom Styling

You can style the text using the standard `TextStyle` property and toggle the icon visibility.

```dart
Greetify(
  name: "Alex",
  showIcon: true,
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
)
```

### 3. Enabling Randomization

By default, the package shows a static standard greeting. To cycle through different variations (e.g., "Rise and Shine" vs "Good Morning"), enable the randomization flag.

```dart
Greetify(
  name: "Alex",
  randomize: true,
)
```

### 4. Using Custom Message Lists

You can override the default greetings with your own lists. If `randomize` is enabled, the package will pick a random message from your custom list. If `randomize` is disabled, it will pick the first item in your list.

```dart
Greetify(
  name: "Alex",
  randomize: true,
  customMorningMessages: [
    "Wake up and code",
    "It is a brand new day",
    "Let's get to work"
  ],
  customNightMessages: [
    "Time to recharge",
    "See you tomorrow"
  ],
)
```

## Configuration Parameters

| Parameter               | Type           | Default | Description                                                                 |
|-------------------------|----------------|---------|-----------------------------------------------------------------------------|
| `name`                  | `String?`      | `null`  | The name of the user to append to the greeting (e.g., "Good Morning, [Name]"). |
| `style`                 | `TextStyle?`   | `null`  | The text style for the greeting message.                                    |
| `showIcon`              | `bool`         | `false` | Determines whether to display the time-based icon (Sun/Moon).               |
| `randomize`             | `bool`         | `false` | If true, selects a random message from the available list. If false, selects the first message. |
| `customMorningMessages` | `List<String>?`| `null`  | A custom list of strings to use between 5:00 AM and 12:00 PM.               |
| `customAfternoonMessages`| `List<String>?`| `null`  | A custom list of strings to use between 12:00 PM and 5:00 PM.               |
| `customEveningMessages` | `List<String>?`| `null`  | A custom list of strings to use between 5:00 PM and 9:00 PM.                |
| `customNightMessages`   | `List<String>?`| `null`  | A custom list of strings to use between 9:00 PM and 5:00 AM.                |

## License
This project is licensed under the MIT License - see the LICENSE file for details.
