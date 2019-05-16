import 'package:flutter/material.dart';

class Functions {

  static Widget menuL(BuildContext context) {

    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new Container(
              height: 120.0,
              child: new DrawerHeader(
                padding: new EdgeInsets.all(0.0),
                decoration: new BoxDecoration(
                  color: new Color(0xFFECEFF1),
                ),
                child: new Center(
                  child: new FlutterLogo(
                    colors: Colors.orange,
                    size: 54.0,
                  ),
                ),
              ),
            ),
            new ListTile(
                leading: new Icon(Icons.accessibility),
                title: new Text('Reservar'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/support');
                }
            ),
            new ListTile(
                leading: new Icon(Icons.chat),
                title: new Text('Support'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/support');
                }
            ),
            new Divider(),
            new ListTile(
                leading: new Icon(Icons.info),
                title: new Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/about');
                }
            ),
          ],
        ),
    );

  }

}