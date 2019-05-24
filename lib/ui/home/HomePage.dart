import 'package:flutter/material.dart';
import 'package:flutter_base_framework/router/NavigatorTool.dart';
import 'package:flutter_base_framework/router/Routes.dart';
import 'package:flutter_base_framework/utils/LogUtil.dart';

class HomePage extends StatelessWidget {
  final String user;
  final String pwd;

  const HomePage({Key key, this.user, this.pwd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    NavigatorTool.addPage("HomePage", context);
    return MaterialApp(
      title: "HomePage",
      home: HomePageFul(
        user: user,
        pwd: pwd,
        mContext: context,
      ),
      routes: Routes.getRoutes(),
    );
  }
}

class HomePageFul extends StatefulWidget {
  final String user;
  final String pwd;
  final BuildContext mContext;

  const HomePageFul({Key key, this.user, this.pwd, this.mContext})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return HomePageState();
  }
}

class HomePageState extends State<HomePageFul> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.user != null) {
      LogUtil.d("user", widget.user);
    }

    if (widget.pwd != null) {
      LogUtil.d("pwd", widget.pwd);
    }
  }

  void _toPage2() {
    NavigatorTool.trunHomepage2("HomePage");
  }

  void _toBack() {
    NavigatorTool.pop("HomePage", result: "1");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 46,
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  child: Text(
                    "ToPage2",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _toPage2();
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
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _toBack();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
