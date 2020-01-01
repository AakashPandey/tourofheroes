import 'package:flutter/material.dart';

import '../view/home.dart';
import '../view/addhero.dart';


final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomeView(),
  AddHeroView.routeName: (context) => AddHeroView(hero: null,)

};
