import 'package:flutter/material.dart';
import 'package:flutter_base_framework/exts/CallBack.dart';
import 'package:flutter_base_framework/ui/home/HomePage.dart';

import 'Routes.dart';

class NavigatorTool {
  static Map<String, BuildContext> _conMap = new Map();

  static void trunHome1(String pagename) {
    _pushNamed(_conMap[pagename], Routes.Home_Page, null);
  }

  static void trunHome2(String pagename, Act1<Object> callback) {
    _pushNamed(_conMap[pagename], Routes.Home_Page, callback);
  }

  static void trunHome3(String pagename) {
    _push(_conMap[pagename],
        new MaterialPageRoute(builder: (context) => new HomePage()), null);
  }

  static void trunHome4(String pagename, Act1<Object> callback) {
    _push(_conMap[pagename],
        new MaterialPageRoute(builder: (context) => new HomePage()), callback);
  }

  static void trunHome5(String pagename, String user, String pwd) {
    _push(
        _conMap[pagename],
        new MaterialPageRoute(
            builder: (context) => new HomePage(
                  user: user,
                  pwd: pwd,
                )),
        null);
  }

  static void trunHomepage2(String pagename) {
    _pushNamed(_conMap[pagename], Routes.Home_Page2, null);
  }

  static void _push(
      BuildContext context, MaterialPageRoute radio, Act1<Object> callback) {
    Navigator.of(context).push(radio).then((obj) {
      if (callback != null) {
        callback(obj);
      }
    });
  }

  static void _pushNamed(
      BuildContext context, String routeName, Act1<Object> callback) {
    Navigator.of(context).pushNamed(routeName).then((obj) {
      if (callback != null) {
        callback(obj);
      }
    });
  }

  static void addPage(String name, BuildContext context) {
    _conMap[name] = context;
  }

  static void pop(String name, {Object result}) {
    if (_conMap.containsKey(name)) {
      Navigator.of(_conMap[name]).pop(result);
      _conMap.remove(name);
    }
  }
}
