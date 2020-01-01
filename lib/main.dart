import 'package:flutter/material.dart';
import './config/routes.dart';
import './config/themes.dart';

import './model/herodata.dart';

final HeroList allHeroesList = HeroList();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tour of Heroes',
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: myTextTheme()),
      routes: routes,
    );
  }
}
