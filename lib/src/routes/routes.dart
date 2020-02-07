import 'package:flutter/material.dart';

import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/map_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/home": (BuildContext context) => HomePage(),
    "alert": (BuildContext context) => AlertPage(),
    "avatar": (BuildContext context) => AvatarPage(),
    "map": (BuildContext context) => StoreMapPage()
  };
}
