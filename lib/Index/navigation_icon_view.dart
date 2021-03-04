

import 'package:flutter/material.dart';

class NavigationIconView {

  NavigationIconView({
    Widget icon,
    String title,
    TickerProvider vsync
  }):
    item = BottomNavigationBarItem(
     icon:icon,
     label: title
    ),
    controller = AnimationController(
      duration: kThemeAnimationDuration,
      vsync: vsync,
    );

  final BottomNavigationBarItem item;
  final AnimationController controller;
}