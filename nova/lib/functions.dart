import 'package:flutter/material.dart';
import 'package:nova/homepage.dart';
import 'package:nova/screens/takeaway.dart';

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
                leading: new Icon(Icons.home),
                title: new Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/homepage');
                }
            ),
            new ListTile(
                leading: new Icon(Icons.restaurant),
                title: new Text('Ementa'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/ementa');
                }
            ),
           new ListTile(
                leading: new Icon(Icons.home),
                title: new Text('Take - Away'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/takeaway');
                }
            ),
            new ListTile(
                leading: new Icon(Icons.calendar_today),
                title: new Text('Reserva'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/reserva');
                }
            ),

            new Divider(),
            new ListTile(
                leading: new Icon(Icons.info),
                title: new Text('Sobre'),
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