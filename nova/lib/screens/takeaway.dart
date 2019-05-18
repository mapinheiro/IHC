import 'package:flutter/material.dart';
import 'package:nova/functions.dart';
class Takeaway extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Scaffold(

      //App Bar
      drawer: Functions.menuL(context),
          appBar: new AppBar(
              title: new Text(
                'Take - Away',
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

      //Content of tabs
          body: new PageView(
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Não tem nenhum pedido efetuado!'),
            ],
          )
        ],
      ),
    );
  }
}