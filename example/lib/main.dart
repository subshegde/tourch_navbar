import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourch_navbar/tourch_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tourch Navbar',
      debugShowCheckedModeBanner: false,
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

final List<Color> tourchColors1 = [
  Colors.green.withOpacity(0.8),
  Colors.green.withOpacity(0.5),
  Colors.transparent
];
final List<Color> tourchColors2 = [
  Colors.blue.withOpacity(0.8),
  Colors.blue.withOpacity(0.5),
  Colors.transparent
];

final List<Color> tourchColors3 = [
  Colors.purple.withOpacity(0.8),
  Colors.purple.withOpacity(0.5),
  Colors.transparent
];

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: TourchNavbarSub(
        tourchColors: tourchColors3,
        iconColor: const Color.fromARGB(255, 162, 79, 176),
        selectedItemColor: Colors.purple,
        icons: const [IconlyLight.home, IconlyLight.search, IconlyLight.category, IconlyLight.setting, IconlyLight.profile],
        onItemTapped: (index) {
        },
      ),
      body: const SafeArea(child:Column()),
    );
  }
}