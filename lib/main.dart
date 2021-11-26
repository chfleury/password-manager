import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './constants.dart';
import './repository/database_creator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();

  runApp(
    Constants(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = Constants.of(context).title;

    return MaterialApp(
      title: title,
      theme: ThemeData(
        fontFamily: 'roboto',
        backgroundColor: Color(0xfff0f0f7),
        primarySwatch: Colors.pink,
      ),
      home: HomePage(title),
    );
  }
}
