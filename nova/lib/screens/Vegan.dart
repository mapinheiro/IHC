import 'package:flutter/material.dart';
import 'package:nova/functions.dart';
import 'package:flutter/foundation.dart';
import 'package:nova/screens/Sopa.dart';
import 'package:nova/screens/Vegan.dart';
import 'package:nova/screens/Acompanhamentos.dart';

class Vegan extends StatefulWidget {
  EmentaPrincipalPage createState() => EmentaPrincipalPage();

}

enum Filtro{Sopa,Carne,Peixe,Vegan, Acompanhamentos, Sobremesa}

class EmentaPrincipalPage extends State<Vegan> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: Functions.menuL(context),
        appBar: new AppBar(
          title: new Text(
            'Ementa',
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
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  child: Text('INFO', style: TextStyle(color: Colors.red[900], fontSize: 18.0)),
                  onPressed: () {
                    showDialog<String>(context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Informação'),
                        content: Text('Os preços apresentados incluem acompanhamentos que são à sua escolha'),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.0),
                //vegan
                Text('Pratos Vegan', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left),
                DataTable(
                  columns: TabelaColunas,
                  rows: _vegan
                      .map(
                        (_pratoRow) => DataRow(
                        cells: [
                          DataCell(Text(_pratoRow.name), showEditIcon: false, placeholder: false),
                          DataCell(Text(_pratoRow.price.toString()+' €')),
                          DataCell(Text(_pratoRow.into))
                        ]),
                  ).toList(),
                ),
                SizedBox(height: 20.0),
              ],
            )
        ),
        floatingActionButton: new FloatingActionButton.extended(
          backgroundColor: Colors.grey,
          label: Text("Filtro", style: new TextStyle(color: Colors.white, fontSize: 30.0),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: (_option),
        )
    );
  }

  Future _option() async {
    switch(
    await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text('Seleccione uma opção', style: TextStyle(fontSize: 18.0, color: Colors.red[900])),
          children: <Widget>[
            new SimpleDialogOption(child: new Text('Sopa'),onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Sopa()));
            },),
            new SimpleDialogOption(child: new Text('Carne'),onPressed: (){Navigator.pop(context, Filtro.Carne);},),
            new SimpleDialogOption(child: new Text('Peixe'),onPressed: (){
            },),
            new SimpleDialogOption(child: new Text('Vegan'),onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Vegan()));
            },),
            new SimpleDialogOption(child: new Text('Acompanhamentos'),onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Acompanhamento()));
            },),
            new SimpleDialogOption(child: new Text('Sobremesa'),onPressed: (){Navigator.pop(context, Filtro.Sobremesa);},),
          ],
        )
    )
    ) {
      case Filtro.Sopa:
        break;
      case Filtro.Carne:
        break;
      case Filtro.Peixe:
        break;
      case Filtro.Vegan:
        break;
      case Filtro.Sobremesa:
        break;
      case Filtro.Acompanhamentos:

        break;
    }
  }

}


const TabelaColunas = <DataColumn>[
  DataColumn(
    label: const Text('Nome', style: TextStyle(fontSize: 12.0)),
  ),
  DataColumn(
    label: const Text('Preço', style: TextStyle(fontSize: 12.0)),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Isento', style: TextStyle(fontSize: 12.0)),
  ),
];

class Prato {
  Prato(this.name, this.price, this.into);
  final String name;
  final double price;
  final String into;

}


var _vegan = <Prato>[
  new Prato('Hamburguer de grâo', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Hamburguer de Beringela', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Beringela recheada', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Hamburguer de Beringela', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Tofu xadrez', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Feijoada com salsichas', 6.00, 'Glúten, lactose'),
];
