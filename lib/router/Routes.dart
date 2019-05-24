import 'package:flutter/material.dart';
import 'package:flutter_base_framework/ui/login/LoginPage.dart';
import 'package:flutter_base_framework/ui/home/HomePage.dart';
import 'package:flutter_base_framework/ui/home/HomePage2.dart';

class Routes {
  static Map<String, WidgetBuilder> routes;

  static String Login_Page = "/loginpage";
  static String Home_Page = "/homepage";
  static String Home_Page2 = "/homepage2";

  static Map<String, WidgetBuilder> getRoutes() {
    if (routes == null) {
      routes = new Map();
      routes.addAll({
        Login_Page: (BuildContext context) => new LoginPage(),
        Home_Page: (BuildContext context) => new HomePage(),
        Home_Page2: (BuildContext context) => new HomePage2(),
      });
    }
    return routes;
  }
}
