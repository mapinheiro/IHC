import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nova/screens/Reserva1.dart';


class NovaReserva extends StatefulWidget {

  NovaReservaPage createState() => NovaReservaPage();

}

class NovaReservaPage extends State<NovaReserva> {
  String dropdownValue = '';
  DateTime date1;
  DateTime time1;
  DateTime now = DateTime.now();

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

            DateTimePickerFormField(
              inputType: InputType.date,
              format: DateFormat("yyyy-MM-dd"),
              initialDate: DateTime.now(),
              editable: false,
              decoration: InputDecoration(
                  labelText: 'Data',
                  hasFloatingPlaceholder: false
              ),
              onChanged: (dt) {
                setState(() => date1 = dt);
                print('Selected date: $date1');
              },
            ),
            //HORA
            SizedBox(height: 20.0),
            DateTimePickerFormField(
              inputType: InputType.time,
              format: DateFormat("HH:mm"),
              initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
              editable: false,
              decoration: InputDecoration(
                  labelText: 'Hora',
                  hasFloatingPlaceholder: false
              ),
              onChanged: (dt) {
                setState(() => time1 = dt);
                print('Selected date: $time1');
                print('Hour: $time1.hour');
                print('Minute: $time1.minute');
              },
            ),
            //NUMERO DE PESSOAS Acrecentar um icon de info para informar o clinte do número máximo
            SizedBox(height: 20.0, width: 10.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                //filled: true,
                //icon: Icon(Icons.phone),
                helperText: "mais que 25 pessoas ligue-nos, clicando no icon 📞",
                hintText: 'máximo até 25 pessoas',
                labelText: 'Número de pessoas',
                suffixIcon: IconButton(icon: Icon(Icons.phone, color: Colors.red[900]), onPressed: () => launch("tel://254595175"))
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
            ),
            SizedBox(height: 50.0, width: 10.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                    color: Colors.red[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    child: Text('Cancelar',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    onPressed: ()=> Navigator.pushNamed(context,'/homepage')
                ),
                new RaisedButton(
                  color: Colors.red[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  child: Text('Reservar',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onPressed:() {
                      Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => Reserva1()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}