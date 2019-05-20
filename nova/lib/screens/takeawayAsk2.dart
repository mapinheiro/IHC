import 'package:flutter/material.dart';
import 'package:nova/functions.dart';

String dropdownValue = 'Bitoque';
class TakeawayAsk2 extends StatefulWidget{
  TakeawayAsk2State createState()=> TakeawayAsk2State();
}
class TakeawayAsk2State extends State<TakeawayAsk2> {
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
      body:  new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
               value: dropdownValue,
               onChanged: (String newValue) {
                 setState(() {
                   dropdownValue = newValue;
          });
        },
        items: <String>['Bitoque','Batata Frita', 'Arroz', 'Ovo Estrelado', 'Bife']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
            .toList(),
          ),
          SizedBox(height: 380.0, width: 320.0),
              new RaisedButton(

                padding:const EdgeInsets.all(10) ,
                onPressed:() {
                  Navigator.pushNamed(context,'/takeawayFinal');
                },
                color: Colors.red[900],


                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 30,color:Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),

          ],
          ),
          // SizedBox(height: 50.0),
        /*  new Column(

            children:<Widget>[
              new RaisedButton(

                padding:const EdgeInsets.only(left: 10,right:10) ,
                onPressed:() {
                  Navigator.pushNamed(context,'/takeawayAsk1');
                },
                color: Colors.red[900],

                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 30,color:Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
      ],*/

          //),
      ),

    );

  }
}