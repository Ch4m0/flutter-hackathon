import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';
import 'package:components/src/routes/routes.dart';
import 'package:components/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Component",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: "/home",
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print("Ruta llamada: ${settings.name} ");
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
