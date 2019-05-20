import 'package:flutter/material.dart';
import 'package:nova/functions.dart';
import 'package:nova/screens/NovaRerserva.dart';

class Reserva extends StatelessWidget {
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
      body: new PageView(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Text('Sem reservas!', style: TextStyle(fontSize: 30)),
              //BUTTON
              new SizedBox(height: 60.0, width: 200.0,
               child: new RaisedButton(
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
        ],
      ),
    );
  }
}
