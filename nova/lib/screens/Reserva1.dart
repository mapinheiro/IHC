import 'package:flutter/material.dart';
import 'package:nova/functions.dart';
import 'package:nova/screens/NovaRerserva.dart';

class Reserva1 extends StatefulWidget{
  Reserva1Page createState() => Reserva1Page();
}

class Reserva1Page extends State<Reserva1> {
  @override
  Widget build (BuildContext context) {
    return new Scaffold(

      //App Bar
      drawer: Functions.menuL(context),
      appBar: new AppBar(
        title: new Text(
          'Reservar Mesa',
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
                        Text('Data: 15/06/2019 Hora: 20:00', style: TextStyle(fontSize: 16.0)),
                        Text('Numero de pessoas: 15', style: TextStyle(fontSize: 16.0)),
                        SizedBox(height: 16.0),
                      ],
                    ),
                    decoration: BoxDecoration(border: Border.all(color: Colors.red[900] )),
                    width: 300.0,
                  ),
                  new Divider(),
                ],
              ),
              SizedBox(height: 350.0),
              //BUTTON
              new SizedBox(height: 60.0, width: 200.0,
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.red[900],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => new NovaReserva()));
                  },
                  child: Text('Nova reserva', style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          )
      ),
    );
  }
}