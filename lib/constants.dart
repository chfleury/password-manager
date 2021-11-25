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
    {"icon": BrandIcons.amazon, "color": Colors.lightBlue},
    {"icon": BrandIcons.apple, "color": Colors.black},
    {"icon": BrandIcons.android, "color": Colors.green},
    {"icon": BrandIcons.windows, "color": Colors.blue},
    {"icon": BrandIcons.bitcoin, "color": Colors.orange},
    {"icon": BrandIcons.udemy, "color": Colors.red},
    {"icon": BrandIcons.twitter, "color": Colors.lightBlue},
    {"icon": BrandIcons.twitch, "color": Colors.purple},
    {"icon": BrandIcons.discord, "color": Color.fromRGBO(78, 93, 148, 1)},
    {"icon": BrandIcons.google, "color": Colors.blue},
    {"icon": BrandIcons.facebook, "color": Colors.blue},
    {"icon": BrandIcons.tumblr, "color": Colors.blueGrey},
    {"icon": BrandIcons.tiktok, "color": Colors.black},
    {"icon": BrandIcons.steam, "color": Colors.black},
    {"icon": BrandIcons.spotify, "color": Colors.greenAccent},
    {"icon": Icons.attach_money, "color": Colors.green},
  ];

  @override
  bool updateShouldNotify(Constants oldWidget) => false;
}
