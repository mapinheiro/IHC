import 'package:flutter/material.dart';
import 'package:nova/homepage.dart';
import 'package:nova/screens/takeaway.dart';

final logo = Hero(
  tag: 'hero_1',
  child: CircleAvatar(

    radius: 100.0, //tamanho da imagem
    child: Image.asset("assets/picapeixe.png"),
  ),
);

class Functions {


  static Widget menuL(BuildContext context) {

    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new Container(
              height: 120.0,
              child: new DrawerHeader(
                padding: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: new Center(
                  child: logo,
                  ),
                ),
              ),
            new ListTile(
                leading: new Icon(Icons.home,color: Colors.red[900]),
                title: new Text('Home'),
                onTap: () {
                //  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/homepage');
                }
            ),
            new ListTile(
                leading: new Icon(Icons.restaurant_menu,color: Colors.red[900]),
                title: new Text('Ementa'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/ementaPrincipal');
                }
            ),
           new ListTile(
                leading: new Icon(Icons.home,color: Colors.red[900]),
                title: new Text('Take - Away'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/takeaway');
                }
            ),
            new ListTile(
                leading: new Icon(Icons.calendar_today,color: Colors.red[900]),
                title: new Text('Reserva'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/reserva');
                }
            ),

            new Divider(),
            new ListTile(
                leading: new Icon(Icons.info,color: Colors.red[900]),
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
