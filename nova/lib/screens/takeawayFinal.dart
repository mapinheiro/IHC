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
            SizedBox(height: 80.0, width:80.0),

              new Divider(),
              SizedBox(height: 10.0),
              Text('Dados do Cliente:', style: TextStyle(color: Colors.red[900], fontSize: 16)),
              //NOME
              SizedBox(height: 10.0),
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

class Entry {
  Entry(this.title,[this.children = const <Entry>[]]);

  final String title;

  final List<Entry> children;

}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Bitoque',

    <Entry>[

      Entry('Batatas Fritas'),
      Entry('Arroz'),
      Entry('Ovo Estrelado'),
      Entry('Salada'),

    ],
  ),
  /*Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  */
  /*Entry(
    'Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),

        ],
      ),
    ],
  ),
  */
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 32.0,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(root.title),
              Switch(
                value: true,
                onChanged: (_) {},
              )
            ]
        ),

      ),

    );

    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}