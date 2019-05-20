import 'package:flutter/material.dart';
import 'package:nova/functions.dart';

String dropdownValue = 'Bitoque';
class TakeawayFinal extends StatefulWidget{
  TakeawayFinalState createState()=> TakeawayFinalState();
}
class TakeawayFinalState extends State<TakeawayFinal> {
  @override
  Widget build (BuildContext context) {
    return new Scaffold(

      //App Bar
      drawer: Functions.menuL(context),
      appBar: new AppBar(
        title: new Text(
          'Meu Pedido',
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
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: new Column(
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
          SizedBox(height: 50.0, width:50.0),

              new Divider(),
              SizedBox(height: 20.0),
              Text('Dados do Cliente:', style: TextStyle(color: Colors.red[900], fontSize: 16)),
              //NOME
              SizedBox(height: 20.0),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.person),
                  hintText: 'Nome próprio e apelido',
                  labelText: 'Nome',
                ),
                style: TextStyle(fontSize: 18),
                /* onSaved: (String tmp) {
                this._nome = tmp;
              },*/
              ),
              //CONTACTO
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.phone),
                  hintText: 'Nº de telefone ou telemóvel',
                  labelText: 'Contacto',
                ),
                style: TextStyle(fontSize: 18),
                /* onSaved: (String tmp) {
                this._contacto = tmp;
              },*/
              ),
            SizedBox(height: 60.0),
              new Text(
                "Total: 9 €",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.right,
              ),
          SizedBox(height: 10.0),
              new RaisedButton(

                padding:const EdgeInsets.all(10) ,
                onPressed:() {
                  Navigator.pushNamed(context,'/homepage');
                },
                color: Colors.red[900],


                child: const Text(
                  'Finalizar Pedido',
                  style: TextStyle(fontSize: 30,color:Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
          ),
      ),

    );

  }
}