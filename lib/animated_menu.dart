import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu.dart';

class AnimatedMenu extends StatefulWidget {
  @override
  _AnimationMenu createState() => _AnimationMenu();
}

class _AnimationMenu extends State<AnimatedMenu>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  double _containerWidth = Get.width;
  double _containerHeight = 0;
  Color _containerColor = Colors.blue;
  AnimatedIconData menuCloseIcon = AnimatedIcons.menu_close;
  late AnimationController _animationController;
  Duration animationDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      _containerHeight = _isExpanded ? Get.height / 3 : 0;

      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code By Chance'),
        centerTitle: true,
        leading: Container(
          alignment: Alignment.center,
          child: GestureDetector(
            child: AnimatedIcon(
              icon: menuCloseIcon,
              progress: _animationController,
            ),
            onTap: () => _toggleExpanded(),
          ),
        ),
      ),
      body: Column(children: [
        AnimatedContainer(
          duration: animationDuration,
          width: _containerWidth,
          height: _containerHeight,
          color: _containerColor,
          curve: Curves.easeInOut,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Menu(
                title: 'Home',
                iconData: Icons.home,
              ),
              Menu(
                title: 'Gallery',
                iconData: Icons.image,
              ),
              Menu(
                title: 'Category',
                iconData: Icons.category,
              ),
              Menu(
                title: 'Info',
                iconData: Icons.info,
              ),
              Menu(
                title: 'Help',
                iconData: Icons.help,
              ),
            ],
          )),
        ),
        SizedBox(
          height: 30,
        ),
        Text('Code By Chance')
      ]),
    );
  }
}
