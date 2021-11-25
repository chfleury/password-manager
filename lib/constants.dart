import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';

class Constants extends InheritedWidget {
  static Constants of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Constants>();

  const Constants({Widget child, Key key}) : super(key: key, child: child);

  final String title = 'Password Manager';
  final String addPass = 'Add new Password';
  final String done = 'Done';
  static const iconsList = [
    {"icon": BrandIcons.netflix, "color": Colors.red},
    {"icon": BrandIcons.amazon, "color": Colors.lightBlue}
  ];

  @override
  bool updateShouldNotify(Constants oldWidget) => false;
}
