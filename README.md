# Tourch Navbar

![touch_navbar](https://github.com/user-attachments/assets/13ac3146-b668-4121-b36e-42152c850c36)


https://github.com/user-attachments/assets/89871e45-ab92-46de-be26-74c2bc14ea92



**Overview**: 
  - A customizable and animated bottom navigation bar for Flutter with smooth transitions, gradient effects, and responsive design.

**Key Features :**

- Custom Icons: Supports a list of customizable icons.
- Animated Indicator: Underline animation for the selected item.
- Gradient Effect: Customizable gradient for the animated indicator.
- Responsive: Adapts to different screen sizes with percentage-based layout.
- Interactive: Trigger actions with onItemTapped callback.

**Customization :**

- Colors: Background, selected/unselected item colors, and icon colors.
- Icons: Customizable icons for each navigation item.
- Gradient: Customizable gradient for the selected item indicator.

## About The Project

**tourch_navbar** is a Flutter package designed to enhance mobile app navigation with an elegant, animated, and fully customizable bottom navigation bar. This package offers a modern, visually appealing way to implement a bottom navigation bar with smooth animations and gradient effects, making it ideal for developers looking to create a unique user experience.

The **tourch_navbar** widget allows for complete control over the icons, colors, and animations, with built-in support for dynamic transitions. It is built to be responsive, ensuring a great look on different screen sizes and devices.

## Getting Started

To use the `tourch_navbar` package in your Flutter project, follow these steps:

### Prerequisites
Ensure you have the following installed on your system:
* [Flutter](https://flutter.dev/docs/get-started/install)
* [Dart](https://dart.dev/get-dart)

### Installation
1. Add the package dependency in your `pubspec.yaml` file:
    ```yaml
    dependencies:
      tourch_navbar:
    ```

2. Install the dependencies by running the following command:
    ```bash
    flutter pub get
    ```

3. Import the package into your Dart file:
    ```dart
    import 'package:tourch_navbar/tourch_navbar.dart';
    ```

## Usage

Here’s how to integrate the `TourchNavbarSub` widget into your Flutter app:

## Demo Video
[![YouTube](https://img.shields.io/badge/-YouTube-black.svg?style=for-the-badge&logo=youtube&colorB=555)](https://youtu.be/RBwSMPQFVSE?si=qzSiuy6VT2S5RZC9)


```dart
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourch_navbar/tourch_navbar.dart';
import 'package:iconly/iconly.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

final List<Color> tourchColor1 = [
  Colors.green.withOpacity(0.8),
  Colors.green.withOpacity(0.5),
  Colors.transparent
];

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: TourchNavbarSub(
        tourchColors: tourchColor1,
        iconColor: const Color.fromARGB(255, 112, 197, 114),
        selectedItemColor: Colors.green,
        icons: const [IconlyLight.home, IconlyLight.search, IconlyLight.category, IconlyLight.setting, IconlyLight.profile],
        onItemTapped: (index) {
        },
      ),
      body: const SafeArea(child:Column()),
    );
  }
}
```
## 🚀 About Me
I'm Subrahmanya S. Hegde, a mobile app developer with expertise in Flutter and React Native, passionate about building high-performance, cross-platform applications. With skills in Kotlin, Node.js, Firebase, and Supabase, I create end-to-end solutions that deliver seamless user experiences.

I hold an MCA degree from MIT Manipal and have a strong passion for exploring new technologies. I am also a strong advocate of using Git and GitHub for version control and collaboration.

Let’s build something great together! 
#### Happy Coding!


## Authors

- [@subshegde](https://www.github.com/subshegde)


## Feedback

If you have any feedback, please reach out to us at subrahmanya460@gmail.com

#### My Github
[![GitHub](https://img.shields.io/badge/-GitHub-black.svg?style=for-the-badge&logo=github&colorB=000000&colorA=333333)](https://github.com/subshegde)
