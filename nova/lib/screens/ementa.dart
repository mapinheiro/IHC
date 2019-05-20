import 'package:flutter/material.dart';
import 'package:nova/functions.dart';

class Ementa extends StatefulWidget {
  EmentaPage createState() => EmentaPage();
}

class EmentaPage extends State<Ementa> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      //App Bar
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
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Prato'),
              columns: TabelaColunas,
              source: PratoDataSource(),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 40.0,
              width: 200.0,
              child: RaisedButton(
                color: Colors.transparent,
                child: Text('Filtro', style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            ),
            SizedBox(height: 50.0),
          ],
        )

      ),
    );
  }
}

const TabelaColunas = <DataColumn>[
  DataColumn(
    label: const Text('Nome'),
  ),
  DataColumn(
    label: const Text('Preço'),
    numeric: true,
  )
];

class Prato {
  Prato(this.name, this.price, this.tipo);
  final String name;
  final double price;
  final String tipo;
  bool selected = false;
}

class PratoDataSource extends DataTableSource {
  int _selectCount = 0;
  final List<Prato> _prato = <Prato>[
    new Prato('Bife à casa', 7.00, 'Carne'),
    new Prato('Arroz de Pato', 7.00, 'Carne'),
    new Prato('Bitoque', 5.0, 'Carne'),
    new Prato('Picanha', 11.00, 'Carne'),
    new Prato('Bacalhau à Casa', 7.00, 'Peixe'),
    new Prato('Lulas Rechadas', 9.00, 'Peixe'),
    new Prato('Bacalhau com natas', 9.0, 'Peixe'),
    new Prato('Polvo à Lagareiro', 9.00, 'Peixe'),
  ];

  @override
  DataRow getRow(int index) {
    if (index >= _prato.length) return null;
    final Prato pratos = _prato[index];
    return DataRow.byIndex(
      index: index,
      selected: pratos.selected,
      onSelectChanged: (bool value) {
        if (pratos.selected != value) {
          _selectCount += value ? 1 : -1;
          assert(_selectCount >= 0);
          pratos.selected = value;
          notifyListeners();
        }
      },
      cells: <DataCell> [
        DataCell (Text('${pratos.name}')),
        DataCell (Text('${pratos.price}')),
      ]
    );
  }

  @override
  int get rowCount => _prato.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectCount;
}