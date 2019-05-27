import 'package:flutter/material.dart';
import 'package:nova/functions.dart';
import 'package:flutter/foundation.dart';
import 'package:nova/screens/Sopa.dart';
import 'package:nova/screens/Vegan.dart';
import 'package:nova/screens/Acompanhamentos.dart';

class EmentaPrincipal extends StatefulWidget {
  EmentaPrincipalPage createState() => EmentaPrincipalPage();

}

enum Filtro{Sopa,Carne,Peixe,Vegan, Acompanhamentos, Sobremesa}

class EmentaPrincipalPage extends State<EmentaPrincipal> {


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
              Text('Sopas de', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left),
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
              //Carnes
              Text('Pratos de Carne', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left),
              DataTable(
                columns: TabelaColunas,
                rows: _carne
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
              //peixe
              Text('Pratos de Peixe', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left),
              DataTable(
                columns: TabelaColunas,
                rows: _peixe
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
              //acompanmentos
              Text('Acompanhamentos', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left),
              DataTable(
                columns: TabelaColunas,
                rows: _acompanhamentos
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
              //sobremesas
              Text('Sobremesas', style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left),
              DataTable(
                columns: TabelaColunas,
                rows: _sobremesa
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
            new Divider(),
            SizedBox(height: 10.0),
            new SimpleDialogOption(child: new Text('Sopa'),onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Sopa()));
            },),
            SizedBox(height: 10.0),
            new SimpleDialogOption(child: new Text('Carne'),onPressed: (){Navigator.pop(context, Filtro.Carne);},),
            SizedBox(height: 10.0),
            new SimpleDialogOption(child: new Text('Peixe'),onPressed: (){
            },),
            SizedBox(height: 10.0),
            new SimpleDialogOption(child: new Text('Vegan'),onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Vegan()));
            },),
            SizedBox(height: 10.0),
            new SimpleDialogOption(child: new Text('Acompanhamentos'),onPressed: (){
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Acompanhamento()));
            },),
            SizedBox(height: 10.0),
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

var _sopa = <Prato>[
  new Prato('Legumes', 2.00, 'Lactose, gluten'),
  new Prato('Peixe', 2.00, 'Lactose, gluten'),
  new Prato('Alho francês', 2.00, 'Lactose, gluten, levedura'),
  new Prato('Batata doce e gengibre', 2.00, 'Lactose, gluten, levedura'),
];

var _carne = <Prato>[
  new Prato('Bife à Pica-peixe', 9.00, 'Glúten, lactose, levedura'),
  new Prato('Bife com molho de 3 pimentas', 9.00, ' '),
  new Prato('Naco de Vitela', 12.00, 'Glúten, lactose'),
  new Prato('Costeletas de Porco', 7.00, 'Glúten, lactose'),
  new Prato('Bitoque', 8.0, 'Glúten, levedura'),
  new Prato('Grelhada mista', 8.0, 'Glúten, lactose'),
  new Prato('Picanha', 13.00, 'Glúten, lactose, levedura'),
];

var _peixe = <Prato>[
  new Prato('Bacalhau à Pica-peixe', 8.00, ' '),
  new Prato('Lulas Recheadas', 9.00, 'Glúten, lactose'),
  new Prato('Corvina grelhada', 10.00, 'Glúten, lactose, levedura'),
  new Prato('Bacalhau à Brás', 9.0, 'Leveduras'),
  new Prato('Polvo à Lagareiro', 9.00, ' '),
];

var _vegan = <Prato>[
  new Prato('Hamburguer de grâo', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Hamburguer de Beringela', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Beringela recheada', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Hamburguer de Beringela', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Tofu xadrez', 6.00, 'Glúten, lactose, levedura'),
  new Prato('Feijoada com salsichas', 6.00, 'Glúten, lactose'),
];

var _acompanhamentos = <Prato>[
  new Prato('Batatas cozidas', 2.00, 'Glúten, lactose, leveduras'),
  new Prato('Batatas fritas', 4.00, 'Glúten, lactose, leveduras'),
  new Prato('Cenora e ervilhas cozidas', 4.00, 'Glúten, lactose, leveduras'),
  new Prato('Arroz Branco', 4.00, 'Glúten, lactose, levedurasda'),
  new Prato('Feijao preto', 4.00, 'Glúten, lactose, levedurasda'),
  new Prato('Salada', 5.00, 'Glúten, lactose, leveduras'),
  new Prato('Migas', 4.00, 'Lactose'),
];

var _sobremesa = <Prato>[
  new Prato('CheeseCake', 4.00, ' '),
  new Prato('Doce da casa', 2.00, ' '),
  new Prato('Pudim caseiro', 2.00, 'Glúten'),
  new Prato('Bolo de bolacha', 4.00, ' '),
  new Prato('Mousse de oreo', 2.00, ' '),
  new Prato('Mousse de chocolate', 2.00, 'Glúten'),
  new Prato('Serradura', 2.00, ' '),
  new Prato('Salada de fruta', 2.00, 'Glúten, lactose, leveduras'),
  new Prato('Maça', 1.00, 'Glúten, lactose, leveduras'),
  new Prato('Pera', 1.00, 'Glúten, lactose, leveduras'),
  new Prato('Manga', 2.00, 'Glúten, lactose, leveduras'),
  new Prato('Morangos', 2.00, 'Glúten, lactose, leveduras'),
  new Prato('Abacaxi', 2.00, 'Glúten, lactose, leveduras'),
  new Prato('Banana', 2.00, 'Glúten, lactose, leveduras'),
];
