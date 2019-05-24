import 'package:flutter/material.dart';
import 'package:flutter_base_framework/dao/UserDao.dart';
import 'package:flutter_base_framework/router/NavigatorTool.dart';
import 'package:flutter_base_framework/router/Routes.dart';
import 'package:flutter_base_framework/utils/LogUtil.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    NavigatorTool.addPage("LoginPage", context);
    return MaterialApp(
      title: "LoginPage",
      routes: Routes.getRoutes(),
      home: LoginPageFul(),
    );
  }
}

class LoginPageFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPageFul> {
  String name = "";
  String pwd = "";

  _login() {
    UserDao.login(name, pwd, (code, vm) {
      if (code == 1) {
        LogUtil.d("LoginPage", vm.msg);
      } else {
        LogUtil.d("LoginPage", vm.msg);
      }
    });
  }

  _toHome() {
//    NavigatorTool.trunHome1(context);
//    NavigatorTool.trunHome2(context, (val) {
//      LogUtil.d("Home页面返回消息", val.toString());
//      switch (val.toString()) {
//        case "1":
//          break;
//        case "2":
//          _toHome();
//          break;
//      }
//    });
//    NavigatorTool.trunHome3(context);
//    NavigatorTool.trunHome4(context, (val) {
//      LogUtil.d("Home页面返回消息", val.toString());
//    });
    NavigatorTool.trunHome5("LoginPage", "传值name", "password");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "LoginPageState",
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFFEEEEEE),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 160),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                autofocus: true,
                style: TextStyle(),
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)),
                onChanged: (val) {
                  name = val;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock)),
                  onChanged: (val) {
                    pwd = val;
                  }),
            ),
            Container(
              width: double.infinity,
              height: 46,
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _toHome();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
