import 'package:flutter/widgets.dart';

class Constants extends InheritedWidget {
  static Constants of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Constants>();

  const Constants({Widget child, Key key}) : super(key: key, child: child);

  final String title = 'Password Manager';

  @override
  bool updateShouldNotify(Constants oldWidget) => false;
}
