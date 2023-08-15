import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/animated_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}
