import 'package:flutter/material.dart';
import 'package:nova/functions.dart';
import 'package:flutter/foundation.dart';
import 'package:nova/screens/Sopa.dart';
import 'package:nova/screens/Vegan.dart';
import 'package:nova/screens/Acompanhamentos.dart';

class Sopa extends StatefulWidget {
  EmentaPrincipalPage createState() => EmentaPrincipalPage();

}

enum Filtro{Sopa,Carne,Peixe,Vegan, Acompanhamentos, Sobremesa}

class EmentaPrincipalPage extends State<Sopa> {


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
                SizedBox(height: 20.0),
                Text('Sopas de', style: TextStyle(fontSize: 18.0), textAlign: TextAlign.left),
                DataTable(
                  columns: TabelaColunas,
                  rows: _sopa
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
        Navigator.of(context).pushNamed('/Sopa');
        break;
      case Filtro.Carne:
      //_setValue('Carne');
        break;
      case Filtro.Peixe:
      //_setValue('Peixe');
        break;
      case Filtro.Vegan:
      // _setValue('Vegan');
        break;
      case Filtro.Sobremesa:
      // _setValue('Sobremesa');
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

var _sopa = <Prato>[
  new Prato('Legumes', 2.00, 'Lactose, gluten'),
  new Prato('Peixe', 2.00, 'Lactose, gluten'),
  new Prato('Alho francês', 2.00, 'Lactose, gluten, levedura'),
  new Prato('Batata doce e gengibre', 2.00, 'Lactose, gluten, levedura'),
];
