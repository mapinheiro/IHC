import 'package:flutter/material.dart';

class NovaReserva extends StatelessWidget {

  //String _nome;
  //String _contacto;
  String dropdownValue = '';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(

      //App Bar
      appBar: new AppBar(
        title: new Text(
          'Reservar Mesa',
          style: TextStyle(
            fontSize: Theme
                .of(context)
                .platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme
            .of(context)
            .platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),

      body: new SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //DATA
            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.red[900],
                child: Text('Seleciona uma Data'),
              onPressed: (){
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2021),
                  ).then<DateTime>((DateTime value){
                    if(value != null) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Selecionou: $value')),
                      );
                    }
                  });
              },
            ),
            //HORA
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.red[900],
              child: Text('Horas'),
              onPressed: () {
                DateTime now = DateTime.now();
                showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
                ).then<TimeOfDay>((TimeOfDay value) {
                  if (value != null) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${value.format(context)}'),
                          action: SnackBarAction(label: 'OK', onPressed: () {}),
                      ),
                    );
                  }
                });
              },
            ),
            //NUMERO DE PESSOAS Acrecentar um icon de info para informar o clinte do número máximo
            SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                //filled: true,
                //icon: Icon(Icons.phone),
                hintText: 'máximo até 25 pessoas',
                labelText: 'Número de pessoas',
              ),
              style: TextStyle(fontSize: 18),
            ),
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
            SizedBox(height: 50.0, width: 10.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  color: Colors.red[900],
                  child: Text('Reservar',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                   // onPressed: null,
                ),
                new RaisedButton(
                  color: Colors.red[900],
                  child: Text('Cancelar',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                 // onPressed: null,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
