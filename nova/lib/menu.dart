import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nova/homepage.dart';


class Menu extends StatefulWidget {

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  PageController _tabController;

  var _title_app = "Adeus que já te vi";

  int _tab = 0;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      new Scaffold(

        //App Bar
          appBar: new AppBar(
            title: new Text(
              _title_app,
              style: new TextStyle(
                fontSize: Theme
                    .of(context)
                    .platform == TargetPlatform.iOS ? 17.0 : 20.0,
              ),
            ),
            elevation: Theme
                .of(context)
                .platform == TargetPlatform.iOS ? 0.0 : 4.0,
          ),
          body: Container(
            child: RaisedButton(onPressed: () =>
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new Home())
                ),
            ),
          ),
      );
  }
