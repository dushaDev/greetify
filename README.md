
# Greetify

Greetify is a flexible and lightweight Flutter package that provides dynamic, time-aware greetings for your application. It automatically detects the time of day to display appropriate messages (e.g., "Good Morning", "Good Evening") and includes features for randomization and custom message lists.

This package is ideal for dashboard headers, welcome screens, and home pages where a personalized user experience is required.
<div align="center">
 <img src="https://github.com/dushaDev/greetify/blob/dev/screenshots/demo_1.png?raw=true" width="200">
  <br>
  <i>Check out the interactive dashboard example</i>
</div>

## Features

- **Time-Aware Logic:** Automatically determines if it is morning, afternoon, evening, or night based on the device system time.
- **Dynamic Icons:** Renders appropriate icons (sun or moon) alongside the text based on the time of day.
- **Randomization:** Optional feature to cycle through a list of greetings to keep the UI fresh.
- **Customization:** Full support for overriding default messages with custom lists for specific times of day.
- **Interactive:** Supports tap callbacks with customizable splash and hover effects.
- **Styling:** Accepts standard Flutter text styling to match your application's design system.

## Installation

Add `greetify` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  greetify: ^0.0.3


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

### 5. Interactive & Custom Colors

You can handle tap events and customize the touch feedback colors (useful for matching app branding).

```dart
Greetify(
  name: "Alex",
  onTap: () {
    print("Greeting clicked!");
  },
  // Customize the interaction colors
  splashColor: Colors.blue.withOpacity(0.3),
  hoverColor: Colors.grey.withOpacity(0.1),
)
```

## Configuration Parameters

| Parameter                 | Type                | Default | Description                                                                                     |
|---------------------------|---------------------|---------|-------------------------------------------------------------------------------------------------|
| `name`                    | `String?`           | `null`  | The name of the user to append to the greeting (e.g., "Good Morning, [Name]").                  |
| `style`                   | `TextStyle?`        | `null`  | The text style for the greeting message.                                                        |
| `showIcon`                | `bool`              | `false` | Determines whether to display the time-based icon (Sun/Moon).                                   |
| `randomize`               | `bool`              | `false` | If true, selects a random message from the available list. If false, selects the first message. |
| `customMorningMessages`   | `List<String>?`     | `null`  | A custom list of strings to use between 5:00 AM and 12:00 PM.                                   |
| `customAfternoonMessages` | `List<String>?`     | `null`  | A custom list of strings to use between 12:00 PM and 5:00 PM.                                   |
| `customEveningMessages`   | `List<String>?`     | `null`  | A custom list of strings to use between 5:00 PM and 9:00 PM.                                    |
| `customNightMessages`     | `List<String>?`     | `null`  | A custom list of strings to use between 9:00 PM and 5:00 AM.                                    |
| `onTap`                   | `VoidCallback?`     | `null`  | Function to execute when the greeting is tapped.                                                |
| `onHover`                 | `Function(bool?)?`  | `null`  | Function to execute when the mouse hovers over the widget.                                      |
| `onLongPress`             | `VoidCallback?`     | `null`  | Function to execute when the widget is long-pressed.                                            |
| `splashColor`             | `Color?`            | `null`  | The color of the splash effect when tapped.                                                     |
| `hoverColor`              | `Color?`            | `null`  | The color when the mouse hovers over the widget (Web/Desktop).                                  |


## License
This project is licensed under the MIT License - see the LICENSE file for details.
