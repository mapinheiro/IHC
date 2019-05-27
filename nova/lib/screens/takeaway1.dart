import 'package:flutter/material.dart';
import 'package:nova/functions.dart';
import 'package:nova/screens/takeaway.dart';


class Takeaway1 extends StatefulWidget{
  Takeaway1Page createState() => Takeaway1Page();
}

class Takeaway1Page extends State<Takeaway1> {
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
      body: new SingleChildScrollView(
          child:
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 30.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    child: Text('1', style: TextStyle(fontSize: 50.0, ), textAlign: TextAlign.center),
                    width: 50.0,
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(height: 16.0),
                        Text('Nome: Mariana Pinheiro', style: TextStyle(fontSize: 16.0)),
                        Text('Data: 24/05/2019', style: TextStyle(fontSize: 16.0)),
                        Text('Bife à Pica - Peixe \n c/ Batata Frita e Arroz Branco', style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center),

                        SizedBox(height: 16.0),
                      ],
                    ),
                    decoration: BoxDecoration(border: Border.all(color: Colors.red[900] )),
                    width: 300.0,
                  ),
                  new Divider(),
                ],
              ),
              SizedBox(height: 300.0),
              //BUTTON
              new SizedBox(height: 60.0, width: 200.0,
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.red[900],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new Takeaway()));
                  },
                  child: Text('Novo Pedido', style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          )
      ),
    );
  }
}