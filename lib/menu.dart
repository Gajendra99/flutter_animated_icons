import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  String title;
  IconData iconData;

  Menu({required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
