import 'package:flutter/material.dart';
import 'package:nova/homepage.dart';
import 'package:nova/screens/takeaway.dart';

class Functions {

  static Widget menuL(BuildContext context) {

    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new Container(
              height: 120.0,
              child: new DrawerHeader(
                padding: new EdgeInsets.all(0.0),
                decoration: new BoxDecoration(
                  color: new Color(0xFFECEFF1),
                ),
                child: new Center(
                  child: new FlutterLogo(
                    colors: Colors.orange,
                    size: 54.0,
                  ),
                ),
              ),
            ),
            new ListTile(
                leading: new Icon(Icons.home),
                title: new Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/homepage');
                }
            ),
            new ListTile(
                leading: new Icon(Icons.restaurant),
                title: new Text('Ementa'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/ementa');
                }
            ),
           new ListTile(
                leading: new Icon(Icons.home),
                title: new Text('Take - Away'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/takeaway');
                }
            ),
            new ListTile(
                leading: new Icon(Icons.calendar_today),
                title: new Text('Reserva'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/reserva');
                }
            ),

            new Divider(),
            new ListTile(
                leading: new Icon(Icons.info),
                title: new Text('Sobre'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/about');
                }
            ),
          ],
        ),
    );

  }
 /* static Widget ementa(BuildContext context){
   return new SingleChildScrollView(
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


static const TabelaColunas = <DataColumn>[
  DataColumn(
    label: const Text('Nome'),
  ),
  DataColumn(
    label: const Text('Preço'),
    numeric: true,
  )
];
 public static class Prato {
  Prato(this.name, this.price, this.tipo);
  final String name;
  final double price;
  final String tipo;
  bool selected = false;
}

static class PratoDataSource extends DataTableSource {
  int _selectCount = 0;
  final List<Prato> _prato = <Prato>[
    new Prato('Bife à casa', 7.00, 'Carne'),
    new Prato('Arroz de Pato', 7.00, 'Carne'),
    new Prato('Bitoque', 5.0, 'Carne'),
    new Prato('Picanha', 11.00, 'Carne'),
    new Prato('Bacalhau à Casa', 7.00, 'Peixe'),
    new Prato('Lulas Recheadas', 9.00, 'Peixe'),
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
  }*/

}